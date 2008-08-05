class PluginPropertyAddPluginInstanceId < ActiveRecord::Migration
  def self.up
    add_column :plugin_properties, :plugin_instance_id, :integer
  end

  def self.down
    remove_column :plugin_properties, :plugin_instance_id
  end
end
