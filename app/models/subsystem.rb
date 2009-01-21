# == Schema Information
# Schema version: 20081201121936
#
# Table name: subsystems
#
#  id         :integer         not null, primary key
#  port       :integer
#  server     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Subsystem
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :port, Integer
  property :server, Integer
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
