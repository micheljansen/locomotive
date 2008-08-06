# == Schema Information
# Schema version: 20080805132828
#
# Table name: plugin_instances
#
#  id          :integer         not null, primary key
#  plugin_type :string(255)     
#  version     :integer         
#  name        :string(255)     
#  created_at  :datetime        
#  updated_at  :datetime        
#

class PluginInstance < ActiveRecord::Base
  has_many :plugin_properties
  
  validates_presence_of :plugin_id, :on => :create, :message => "can't be blank"
  
end
