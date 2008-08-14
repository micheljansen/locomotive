# == Schema Information
# Schema version: 20080814141021
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
end
