class Platform < ActiveRecord::Base
  has_many :service_instances
  has_many :platform_memberships, :dependent => :destroy
  has_many :servers, :through => :platform_memberships
end
