# == Schema Information
# Schema version: 20080822082018
#
# Table name: purposes
#
#  id         :integer         not null, primary key
#  role_id    :integer         
#  server_id  :integer         
#  created_at :datetime        
#  updated_at :datetime        
#

class Purpose < ActiveRecord::Base
  belongs_to :role
  belongs_to :server
  
  validates_uniqueness_of :role_id, :scope => :server_id, 
                          :message => "already assigned to this server."
end
