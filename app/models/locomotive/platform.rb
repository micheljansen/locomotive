module Locomotive
  class Platform
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String

    timestamps :on

    has n, :deployments
    has n, :platform_memberships # :dependent => :destroy
    has n, :servers, :through => :platform_memberships

    validates_present :name

    is_paginated

    # a list of servers not part of this platform
    def other_servers
      # TODO: handle this via SQL instead of substracting sets in Ruby
      Server.all - servers
    end

    # a list of all platforms except this one
    def others
      Platform.all - [self]
    end

    # returns the membership for a given server
    # or nil if not found
    def membership_for_server_id(server_id)
      platform_memberships.all(:server_id => server_id)
    end
  end
end
