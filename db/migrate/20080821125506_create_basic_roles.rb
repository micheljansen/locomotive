require 'active_record/fixtures'

# loads the basic roles from a yaml file to database

class CreateBasicRoles < ActiveRecord::Migration
  def self.up
    Role.delete_all
    
    directory = File.join(File.dirname(__FILE__), 'data') 
    p directory
    Fixtures.create_fixtures(directory, "roles") 
    
  end

  def self.down
    Role.delete_all
  end
end
