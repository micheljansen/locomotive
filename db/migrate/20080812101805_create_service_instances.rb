class CreateServiceInstances < ActiveRecord::Migration
  def self.up
    create_table :service_instances do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :service_instances
  end
end
