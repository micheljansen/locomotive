class CreateSubsystems < ActiveRecord::Migration
  def self.up
    create_table :subsystems do |t|
      t.integer :port
      t.integer :server

      t.timestamps
    end
  end

  def self.down
    drop_table :subsystems
  end
end
