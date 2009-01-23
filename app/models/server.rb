# == Schema Information
# Schema version: 20081201121936
#
# Table name: servers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  hostname   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'ping'
require 'purpose' # Related classes not loaded by Rails TODO: investigate this
require 'role'    # Related classes not loaded by Rails TODO: investigate this

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
