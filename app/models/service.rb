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

class Service < ActiveRecord::Base
  has_many :releases, :dependent => :destroy
  has_many :service_instances, :through => :releases, :dependent => :destroy
  has_many :contracts, :dependent => :destroy
  has_many :clients, :through => :contracts
  
  validates_presence_of :service_type_type, :on => :create, :message => "can't be blank"
  validate :service_type_exists?
  
  def service_type
    service_type_type.to_s.constantize
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
