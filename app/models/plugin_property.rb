class PluginProperty
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :key, String
  property :value, String
  property :created_at, DateTime
  property :updated_at, DateTime
  property :plugin_instance_id, Integer

  belongs_to :plugin_instance
end
