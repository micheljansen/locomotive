class PluginInstance < ActiveRecord::Base
  has_many :plugin_properties
  
  validates_presence_of :plugin_id, :on => :create, :message => "can't be blank"
  
end
