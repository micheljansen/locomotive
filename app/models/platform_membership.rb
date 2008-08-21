class PlatformMembership < ActiveRecord::Base
  belongs_to :server
  belongs_to :platform
end