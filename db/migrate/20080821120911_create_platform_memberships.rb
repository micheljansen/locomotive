class CreatePlatformMemberships < ActiveRecord::Migration
  def self.up
    create_table :platform_memberships do |t|
      t.integer :server_id
      t.integer :platform_id

      t.timestamps
    end
  end

  def self.down
    drop_table :platform_memberships
  end
end
