# == Schema Information
# Schema version: 20080821134651
#
# Table name: platforms
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Platform < ActiveRecord::Base
  has_many :service_instances
  has_many :platform_memberships, :dependent => :destroy
  has_many :servers, :through => :platform_memberships
end
