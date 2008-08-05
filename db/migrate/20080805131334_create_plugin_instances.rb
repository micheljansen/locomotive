class CreatePluginInstances < ActiveRecord::Migration
  def self.up
    create_table :plugin_instances do |t|
      t.string :plugin_type
      t.integer :version
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :plugin_instances
  end
end
