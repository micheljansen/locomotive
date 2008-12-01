class ServiceInstanceAddReferenceToClientAndRelease < ActiveRecord::Migration
  def self.up
    add_column :service_instances, :client_id, :integer
    add_column :service_instances, :release_id, :integer
  end

  def self.down
    remove_column :service_instances, :client_id
    remove_column :service_instances, :release_id
  end
end
