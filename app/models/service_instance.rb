# == Schema Information
# Schema version: 20080814141021
#
# Table name: service_instances
#
#  id         :integer         not null, primary key
#  created_at :datetime        
#  updated_at :datetime        
#

class ServiceInstance < ActiveRecord::Base
  belongs_to :release
  has_one :platform
end
