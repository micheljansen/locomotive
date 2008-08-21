class Role < ActiveRecord::Base
  has_many :fulfillments, :dependent => :destroy
  has_many :servers, :through => :fulfillments
end