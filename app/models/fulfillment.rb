class Fulfillment < ActiveRecord::Base
  belongs_to :role
  belongs_to :server
end
