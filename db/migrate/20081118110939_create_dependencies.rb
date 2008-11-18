class CreateDependencies < ActiveRecord::Migration
  def self.up
    create_table :dependencies do |t|
      t.integer :role_id
      t.integer :service_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dependencies
  end
end
