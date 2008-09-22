class Subsystem < ActiveRecord::Base
  
  def self.types
    @types ||= []
  end
  
  def self.register(type)
    puts "registering #{type}"
    types << type
  end
  
end