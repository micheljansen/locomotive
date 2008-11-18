# == Schema Information
# Schema version: 20080822082018
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
  
  belongs_to :service_type #, :dependent => :nullify
end
