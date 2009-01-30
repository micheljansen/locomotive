class Subsystem
  include DataMapper::Resource

  property :id,         Serial
  property :port,       Integer
  property :server,     Integer

  timestamps :on

  def self.types
    @types ||= []
  end

  def self.register(type)
    puts "registering #{type}"
    types << type
  end

end
