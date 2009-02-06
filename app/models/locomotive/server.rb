require 'ping'

module Locomotive
  class Server
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String,  :nullable => false
    property :hostname,   String,  :nullable => false, :length => 2..255,
                                   :format => Proc.new { |code| code =~ /(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\\-]*[a-zA-Z0-9])\\.)*([A-Za-z]|[A-Za-z][A-Za-z0-9\\-]*[A-Za-z0-9])$/ }
    timestamps :on

    has n, :platform_memberships # :dependent => :destroy
    has n, :platforms, :through => :platform_memberships
    has n, :purposes # :dependent => :destroy
    has n, :roles, :through => :purposes

    is_paginated

    def others
      Server.all - [self]
    end

    def check
      puts "pinging #{hostname}"
      return Ping.pingecho(hostname, 10)
    end

  end
end
