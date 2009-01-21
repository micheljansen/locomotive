# == Schema Information
# Schema version: 20081201121936
#
# Table name: contracts
#
#  id         :integer         not null, primary key
#  client_id  :integer
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Contract
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :client_id, Integer
  property :service_id, Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  # add_index "contracts", ["client_id"], :name => "index_contracts_on_client_id"
  # add_index "contracts", ["service_id"], :name => "index_contracts_on_service_id"

  belongs_to :client
  belongs_to :service

  validates_present :client_id, :on => :create, :message => "can't be blank"
  validates_present :service_id, :on => :create, :message => "can't be blank"
end
