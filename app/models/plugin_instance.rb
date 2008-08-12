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
  has_many :plugin_properties, :dependent => :destroy
  
  #validates_presence_of :plugin_type, :on => :create, :message => "can't be blank"
  validates_presence_of :plugin_type, :on => :create, :message => "can't be blank. This should not happen"
  validates_presence_of :version, :on => :create, :message => "can't be blank. This should not happen"
  validates_presence_of :name, :on => :create, :message => "should be provided"
  validates_uniqueness_of :name, :on => :create, :message => "should be unique"
  
  # gives the plugin that is the template of this instance
  def plugin
    @plugin ||= Locomotive::Plugin.find_by_id(plugin_type)
  end
  
  delegate :description, :to => :plugin
  
  def plugin_properties_that_explodes
      raise "this method should not be used to collect properties from a plugin instance. Use PluginInstance#properties instead."
    
  end
  
  def plugin_properties_with_inherited_defaults(force_reload=false)
    logger.debug("PPWID================")
    props = {}
    
    plugin.properties.each do |key, value|
      props[key] = plugin_properties_without_inherited_defaults.new(:key => key.to_s, :value => value)
    end
      
    
    overridden_properties = plugin_properties_without_inherited_defaults(force_reload)
    
    overridden_properties.each do |p|
      logger.debug("Overriding #{p.key} with #{p.value}")
      props[p.key.to_sym] = p
    end
    
    return plugin_properties_without_inherited_defaults.replace(props.values)
    
  end
  
  def plugin_properties=(props)
    logger.debug("setting plugin_properties to #{p props}")
    
    props.each do |p|
      plugin_properties.build(p)
    end
  end
  
  # get all properties, respecting inheritance from the plugin defaults, as a hash
  def properties
    plugin_properties.inject({}) {|props, p| props.merge(p.key.to_sym => p.value)}
  end
  
  alias_method :plugin_properties_without_inherited_defaults, 
               :plugin_properties 
  
  alias_method :plugin_properties, 
               :plugin_properties_with_inherited_defaults

 
end
