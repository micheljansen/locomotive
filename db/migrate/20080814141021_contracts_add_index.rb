class ContractsAddIndex < ActiveRecord::Migration
  def self.up
    add_index :contracts, :client_id
    add_index :contracts, :service_id
  end

  def self.down
    remove_index :contracts, :client_id
    remove_index :contracts, :service_id
  end
end
