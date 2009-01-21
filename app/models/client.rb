# == Schema Information
# Schema version: 20081201121936
#
# Table name: clients
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
require 'contract'  # Related classes not loaded by Rails TODO: investigate this

class Client
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :name, String
  property :description, Text
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :contracts
  has n, :services, :through => :contracts
  has n, :service_instances

  validates_present :name, :on => :create, :message => "can't be blank"

  # def instances_for_service_id(service_id)
  #     service_instances.find_by_server_id(server_id)
  #   end

end
