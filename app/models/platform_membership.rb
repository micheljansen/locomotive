# == Schema Information
# Schema version: 20080821134651
#
# Table name: platform_memberships
#
#  id          :integer         not null, primary key
#  server_id   :integer         
#  platform_id :integer         
#  created_at  :datetime        
#  updated_at  :datetime        
#

class PlatformMembership < ActiveRecord::Base
  belongs_to :server
  belongs_to :platform
end
