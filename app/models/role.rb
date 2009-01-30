class Role
  include DataMapper::Resource
  
  property :id,         Serial
  property :name,       String,  :nullable => false, :length => 0..50
  property :created_at, DateTime
  property :updated_at, DateTime
  
  has n, :purposes # :dependent => :destroy
  has n, :servers, :through => :purposes
  
  validates_is_unique :name
end
