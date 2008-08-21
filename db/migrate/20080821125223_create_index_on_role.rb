class CreateIndexOnRole < ActiveRecord::Migration
  def self.up
    add_index :roles, :name
  end

  def self.down
    remove_index :roles, :name
  end
end
