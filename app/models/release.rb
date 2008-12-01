# == Schema Information
# Schema version: 20081118111804
#
# Table name: releases
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#  service_id :integer         
#

class Release < ActiveRecord::Base
  belongs_to :service
  has_many :instances
  
  validates_presence_of :service_id, :message => "unknown for this release"
  
end
