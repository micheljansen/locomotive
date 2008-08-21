class Server < ActiveRecord::Base
  has_many :platform_memberships, :dependent => :destroy
  has_many :platforms, :through => :platform_memberships, :source => :platform
end