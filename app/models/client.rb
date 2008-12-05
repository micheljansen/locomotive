# == Schema Information
# Schema version: 20081201121936
#
# Table name: clients
#
#  id          :integer         not null, primary key
#  name        :string(255)     
#  description :string(255)     
#  created_at  :datetime        
#  updated_at  :datetime        
#

class Client < ActiveRecord::Base
  has_many :contracts
  has_many :services, :through => :contracts
  has_many :service_instances
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
  # def instances_for_service_id(service_id)
  #     service_instances.find_by_server_id(server_id)
  #   end
end
