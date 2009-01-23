require 'ping'

class Server
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :name, String
  property :hostname, String
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :platform_memberships # :dependent => :destroy
  has n, :platforms, :through => :platform_memberships
  has n, :purposes # :dependent => :destroy
  has n, :roles, :through => :purposes

  def others
    Server.all - [self]
  end

  def check
    puts "pinging #{hostname}"
    return Ping.pingecho(hostname, 10)
  end

end
