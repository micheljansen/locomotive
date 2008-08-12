class Client < ActiveRecord::Base
  has_many :applications
  has_many :application_instances  
end
