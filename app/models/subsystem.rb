class Subsystem
  include DataMapper::Resource

  property :id,         Serial
  property :port,       Integer
  property :server,     Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  def self.types
    @types ||= []
  end

  def self.register(type)
    puts "registering #{type}"
    types << type
  end

end
