module Locomotive
  class Role
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String,  :nullable => false, :length => 0..50

    timestamps :on

    has n, :purposes # :dependent => :destroy
    has n, :servers, :through => :purposes

    validates_is_unique :name
  end
end
