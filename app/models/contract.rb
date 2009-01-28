class Contract
  include DataMapper::Resource

  property :id,         Integer, :serial => true
  property :client_id,  Integer, :index => true
  property :service_id, Integer, :index => true
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :client
  belongs_to :service

  validates_present :client_id,  :with => [:create], :message => "can't be blank"
  validates_present :service_id, :with => [:create], :message => "can't be blank"
end
