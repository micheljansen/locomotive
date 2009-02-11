module Locomotive
  class Role
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String,  :nullable => false, :length => 0..50

    timestamps :on

    has n, :purposes # :dependent => :destroy
    has n, :systems, :through => :purposes

    validates_is_unique :name

    is_paginated

  end
end
