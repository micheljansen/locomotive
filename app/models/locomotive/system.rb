require 'ping'

module Locomotive
  class System
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String,  :nullable => false
    property :hostname,   String,  :nullable => false, :length => 2..255,
                                   :format => Proc.new { |code| code =~ /(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\\-]*[a-zA-Z0-9])\\.)*([A-Za-z]|[A-Za-z][A-Za-z0-9\\-]*[A-Za-z0-9])$/ }
    # property :ip_addresses,     String
    property :virtual,          Boolean

    property :operating_system_id, Integer

    timestamps :on

#    has n, :server_processors
#    has n, :processors, :through => :server_processors
    has n, :platform_memberships # :dependent => :destroy
    has n, :platforms, :through => :platform_memberships
    has n, :purposes # :dependent => :destroy
    has n, :roles, :through => :purposes
    has n, :subsystems

    belongs_to :operating_system

    validates_present :operating_system

    is_paginated

    attr_accessor :role_ids

    after :save, :assign_roles

    def others
      System.all(:id.not => self.id)
    end

    def check
      puts "pinging #{hostname}"
      return Ping.pingecho(hostname, 10)
    end

    def delete_purposes
      purposes.each { |p| p.destroy }
    end
    alias delete_roles delete_purposes

    private

    def assign_roles
      unless new_record?
        self.delete_purposes
        self.purposes.reload
      end
      self.role_ids.each do |id|
        role = Role.first_or_create(:id => id)
        Purpose.create(:system_id => self.id, :role_id => role.id)
      end unless role_ids.nil?
    end

  end
end
