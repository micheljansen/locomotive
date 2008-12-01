class ServiceAddServiceTypeType < ActiveRecord::Migration
  def self.up
    add_column :services, :service_type_type, :string
  end

  def self.down
    remove_column :services, :service_type_type, :string
  end
end
