class Release < ActiveRecord::Base
  belongs_to :service
  has_many :instances
end