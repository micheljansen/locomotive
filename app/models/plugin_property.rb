# == Schema Information
# Schema version: 20081201121936
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
