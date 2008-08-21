# == Schema Information
# Schema version: 20080821121013
#
# Table name: servers
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  hostname   :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Server < ActiveRecord::Base
  has_many :platform_memberships, :dependent => :destroy
  has_many :platforms, :through => :platform_memberships, :source => :platform
  has_many :fulfillments
  has_many :roles, :through => :fulfillments
end