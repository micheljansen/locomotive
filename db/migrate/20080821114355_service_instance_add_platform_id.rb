class ServiceInstanceAddPlatformId < ActiveRecord::Migration
  def self.up
    add_column :service_instances, :platform_id, :integer
  end

  def self.down
    remove_column :service_instances, :platform_id
  end
end