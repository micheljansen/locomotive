class ServiceInstanceAddReferenceToClient < ActiveRecord::Migration
  def self.up
    add_column :service_instances, :client_id, :integer
  end

  def self.down
    remove_column :service_instances, :client_id
  end
end
