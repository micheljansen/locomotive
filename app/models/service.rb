# == Schema Information
# Schema version: 20080814141021
#
# Table name: services
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Service < ActiveRecord::Base
  has_many :releases
  has_many :service_instances, :through => :releases
  has_many :contracts
  has_many :clients, :through => :contracts
end
