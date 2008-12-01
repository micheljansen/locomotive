# == Schema Information
# Schema version: 20081118111804
#
# Table name: contracts
#
#  id         :integer         not null, primary key
#  client_id  :integer         
#  service_id :integer         
#  created_at :datetime        
#  updated_at :datetime        
#

class Contract < ActiveRecord::Base
  belongs_to :client
  belongs_to :service
  
  validates_presence_of :client_id, :on => :create, :message => "can't be blank"
  validates_presence_of :service_id, :on => :create, :message => "can't be blank"
end
