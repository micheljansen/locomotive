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
  has_many :releases, :dependent => :destroy
  has_many :service_instances, :through => :releases, :dependent => :destroy
  has_many :contracts, :dependent => :destroy
  has_many :clients, :through => :contracts
end
