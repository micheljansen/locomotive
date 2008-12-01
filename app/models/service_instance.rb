# == Schema Information
# Schema version: 20081201121936
#
# Table name: service_instances
#
#  id          :integer         not null, primary key
#  created_at  :datetime        
#  updated_at  :datetime        
#  platform_id :integer         
#  client_id   :integer         
#  release_id  :integer         
#

class ServiceInstance < ActiveRecord::Base
  belongs_to :release
  belongs_to :client
  belongs_to :platform
  
  validates_presence_of :release, :on => :create, :message => "can't be blank"
  validates_presence_of :client, :on => :create, :message => "can't be blank"
  validates_presence_of :platform, :on => :create, :message => "can't be blank"
  
  def deploy
    # find the service_type to delegate this request to
    service_type = release.service.service_type
    puts "ServiceType: #{service_type.name}"
    service_type.deploy(self)
  end
  
  # convenience accessor to service through release
  def service
    release.service if release
  end
  
end
