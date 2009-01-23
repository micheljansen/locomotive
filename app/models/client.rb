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
