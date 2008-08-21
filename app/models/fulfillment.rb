# == Schema Information
# Schema version: 20080821134651
#
# Table name: fulfillments
#
#  id                :integer         not null, primary key
#  role_id           :integer         
#  server_id         :integer         
#  subsystem_type_id :integer         
#  created_at        :datetime        
#  updated_at        :datetime        
#

class Fulfillment < ActiveRecord::Base
  belongs_to :role
  belongs_to :server
end
