class Service < ActiveRecord::Base
  has_many :releases
  has_many :service_instances, :through => :releases
  has_many :clients
end
