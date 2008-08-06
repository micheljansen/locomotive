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
  
  #validates_presence_of :plugin_type, :on => :create, :message => "can't be blank"
  validates_presence_of :plugin_type, :on => :create, :message => "can't be blank. This should not happen"
  validates_presence_of :version, :on => :create, :message => "can't be blank. This should not happen"
  validates_presence_of :name, :on => :create, :message => "should be provided"
  validates_uniqueness_of :name, :on => :create, :message => "should be unique"
  
  # gives the plugin that is the template of this instance
  def plugin
    logger.debug("PluginInstance #{self} looking up plugin #{plugin_type}")
    Locomotive::Plugin.find_by_id(plugin_type)
  end
  
end
