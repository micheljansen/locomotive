class Client < ActiveRecord::Base
  has_many :services
  has_many :service_instances
end
