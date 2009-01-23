class Role
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  property :name, String
  property :created_at, DateTime
  property :updated_at, DateTime
  
  has n, :purposes # :dependent => :destroy
  has n, :servers, :through => :purposes
  
  validates_is_unique :name
end
