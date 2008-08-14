# == Schema Information
# Schema version: 20080814065844
#
# Table name: clients
#
#  id          :integer         not null, primary key
#  name        :string(255)     
#  description :string(255)     
#  created_at  :datetime        
#  updated_at  :datetime        
#

class Client < ActiveRecord::Base
  has_many :services
  has_many :service_instances
end
