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
  
  def service_type
    service_type_type.to_s.constantize
  end
end
