# == Schema Information
# Schema version: 20081118111804
#
# Table name: service_types
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class ServiceType < ActiveRecord::Base
  has_many :services
end
