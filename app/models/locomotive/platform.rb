module Locomotive
  class Platform
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String

    timestamps :on

    has n, :deployments
    has n, :platform_memberships # :dependent => :destroy
    has n, :systems, :through => :platform_memberships

    validates_present :name

    is_paginated

    # a list of systems not part of this platform
    def other_systems
      systems_ids = systems.collect { |s| s.id }
      System.all(:id.not => systems_ids)
    end

    # a list of all platforms except this one
    def others
      Platform.all(:id.not => self.id)
    end

    # returns the membership for a given system
    # or nil if not found
    def membership_for_system_id(system_id)
      platform_memberships.all(:system_id => system_id)
    end
  end
end
