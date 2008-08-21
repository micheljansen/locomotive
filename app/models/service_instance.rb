# == Schema Information
# Schema version: 20080821134651
#
# Table name: service_instances
#
#  id          :integer         not null, primary key
#  created_at  :datetime        
#  updated_at  :datetime        
#  platform_id :integer         
#

class ServiceInstance < ActiveRecord::Base
  belongs_to :release
  has_one :platform
end
