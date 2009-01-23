class Purpose
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :role_id, Integer
  property :server_id, Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :role
  belongs_to :server

  validates_is_unique :role_id, :scope => :server_id,
                          :message => "already assigned to this server."
end
