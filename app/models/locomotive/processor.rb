module Locomotive
  class Processor
    include DataMapper::Resource

    property :id,   Serial
    property :name, String, :nullable => false

  end
end
