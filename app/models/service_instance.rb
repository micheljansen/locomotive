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
  
  def deploy
    # find the service_type to delegate this request to
    service_type = release.service.service_type.new
    puts "ServiceType: #{service_type.name}"
    service_type.deploy(self)
  end
end
