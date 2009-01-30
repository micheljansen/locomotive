class Dependency
  include DataMapper::Resource

  property :id,         Serial
  property :role_id, Integer
  property :service_type_id, Integer
  property :created_at, DateTime
  property :updated_at, DateTime

end
