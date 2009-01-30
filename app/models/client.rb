class Client
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :description, Text

  timestamps :on

  has n, :contracts
  has n, :services, :through => :contracts
  has n, :service_instances

  validates_present :name, :with => [:create], :message => "can't be blank"

  # def instances_for_service_id(service_id)
  #     service_instances.find_by_server_id(server_id)
  #   end

end
