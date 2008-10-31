require 'ping'

# == Schema Information
# Schema version: 20080822082018
#
# Table name: servers
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  hostname   :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Server < ActiveRecord::Base
  has_many :platform_memberships, :dependent => :destroy
  has_many :platforms, :through => :platform_memberships
  has_many :purposes, :dependent => :destroy
  has_many :roles, :through => :purposes
  
  def others
    Server.find(:all) - [self]
  end
  
  def check
    puts "pinging #{hostname}"
    return (Ping.pingecho hostname, 10)
  end
end
