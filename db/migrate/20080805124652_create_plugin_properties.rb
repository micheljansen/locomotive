class CreatePluginProperties < ActiveRecord::Migration
  def self.up
    create_table :plugin_properties do |t|
      t.string :key
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :plugin_properties
  end
end
