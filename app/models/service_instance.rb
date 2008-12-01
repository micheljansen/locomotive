# == Schema Information
# Schema version: 20081118111804
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
  belongs_to :client
  belongs_to :platform
end
