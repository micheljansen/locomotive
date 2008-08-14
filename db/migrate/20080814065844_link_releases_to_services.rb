class LinkReleasesToServices < ActiveRecord::Migration
  def self.up
    add_column :releases, :service_id, :integer
    add_index :releases, :service_id
  end

  def self.down
    remove_column :releases, :service_id
    remove_index :releases, :service_id
  end
end
