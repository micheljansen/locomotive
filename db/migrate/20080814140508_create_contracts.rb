class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :client_id
      t.integer :service_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
