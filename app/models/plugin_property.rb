# == Schema Information
# Schema version: 20080814065844
#
# Table name: plugin_properties
#
#  id                 :integer         not null, primary key
#  key                :string(255)     
#  value              :string(255)     
#  created_at         :datetime        
#  updated_at         :datetime        
#  plugin_instance_id :integer         
#

class PluginProperty < ActiveRecord::Base
  belongs_to :plugin_instance
end
