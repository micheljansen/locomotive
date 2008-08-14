# == Schema Information
# Schema version: 20080814065844
#
# Table name: service_instances
#
#  id         :integer         not null, primary key
#  created_at :datetime        
#  updated_at :datetime        
#

class ServiceInstance < ActiveRecord::Base
  belongs_to :release
end
