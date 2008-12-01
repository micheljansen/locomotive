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

class Subsystem < ActiveRecord::Base
  
  def self.types
    @types ||= []
  end
  
  def self.register(type)
    puts "registering #{type}"
    types << type
  end
  
end
