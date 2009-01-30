class PluginProperty
  include DataMapper::Resource

  property :id,         Serial
  property :key,        String
  property :value,      String
  property :plugin_instance_id, Integer

  timestamps :on

  belongs_to :plugin_instance
end
