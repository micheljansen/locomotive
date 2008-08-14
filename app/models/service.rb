# == Schema Information
# Schema version: 20080814065844
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
  has_many :clients
end
