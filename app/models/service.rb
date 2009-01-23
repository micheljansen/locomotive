# == Schema Information
# Schema version: 20081201121936
#
# Table name: services
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  service_type_type :string(255)
#

class Service
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :name, String
  property :created_at, DateTime
  property :updated_at, DateTime
  property :service_type_type, String

  has n, :releases # :dependent => :destroy
  has n, :service_instances, :through => :releases # :dependent => :destroy
  has n, :contracts # :dependent => :destroy
  has n, :clients, :through => :contracts

  validates_present :service_type_type, :on => :create, :message => "can't be blank"
  validates_with_method :service_type_exists?

  def service_type
    service_type_type.to_s # TODO .constantize
  end

  def service_type_exists?
    if(!ServiceType.known_service_types.map {|st| st.to_s }.include? service_type_type)
      errors.add(:service_type, "does not exist. Must be one of [#{ServiceType.known_service_types.join(',')}]")
    end
  end

  def instances_for_client_id(client_id)
    service_instances.find_all_by_client_id(client_id)
  end
end
