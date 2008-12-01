# == Schema Information
# Schema version: 20081118111804
#
# Table name: dependencies
#
#  id              :integer         not null, primary key
#  role_id         :integer         
#  service_type_id :integer         
#  created_at      :datetime        
#  updated_at      :datetime        
#

class Dependency < ActiveRecord::Base
  belongs_to :service_type
  belongs_to :role
  
  validates_uniqueness_of :role_id, :scope => :service_type_id,
                          :message => "already assigned to this servicetype"
end
