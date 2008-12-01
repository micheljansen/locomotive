# == Schema Information
# Schema version: 20081118111804
#
# Table name: platforms
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Platform < ActiveRecord::Base
  has_many :service_instances
  has_many :platform_memberships, :dependent => :destroy
  has_many :servers, :through => :platform_memberships
  
  # a list of servers not part of this platform
  def other_servers
    # TODO: handle this via SQL instead of substracting sets in Ruby
    Server.find(:all) - servers
  end
  
  # a list of all platforms except this one
  def others
    Platform.find(:all) - [self]
  end
  
  # returns the membership for a given server
  # or nil if not found
  def membership_for_server_id(server_id)
    
    platform_memberships.each do |m|
      return m if m.server_id = server_id
    end
    
    return nil
    
  end
end
