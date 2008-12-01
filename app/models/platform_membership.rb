# == Schema Information
# Schema version: 20081201121936
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
  
  validates_presence_of :server_id
  validates_presence_of :platform_id
  
  validates_associated :server, :on => :save
  validates_associated :platform, :on => :save
  
  # workaround rails bug #5369
  # causing validates_associated not to fail on nonexisting id's
  validates_each :server, :platform do |record, attr, value|
       record.errors.add attr, 'is invalid' if value.nil?
  end
  
  validates_uniqueness_of :server_id, :scope => :platform_id, 
                          :message => "already belongs to this platform"
end
