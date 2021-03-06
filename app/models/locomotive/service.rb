module Locomotive
  class Service
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String
    property :service_type_type, String

    timestamps :on

    has n, :releases # :dependent => :destroy
    has n, :deployments, :through => :releases # :dependent => :destroy
    has n, :contracts # :dependent => :destroy
    has n, :clients, :through => :contracts

    validates_present :service_type_type, :with => [:client], :message => "can't be blank"
    validates_with_method :service_type_exists?

    is_paginated

    def service_type
      service_type_type.to_s # TODO .constantize
    end

    def service_type_exists?
      if(!ServiceType.known_service_types.map {|st| st.to_s }.include? service_type_type)
        errors.add(:service_type, "does not exist. Must be one of [#{ServiceType.known_service_types.join(',')}]")
      end
    end

    def instances_for_client_id(client_id)
      deployments.find_all_by_client_id(client_id)
    end
  end
end
