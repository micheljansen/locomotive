class CreateFulfillments < ActiveRecord::Migration
  def self.up
    create_table :fulfillments do |t|
      t.integer :role_id
      t.integer :server_id
      t.timestamps
    end
  end

  def self.down
    drop_table :fulfillments
  end
end
