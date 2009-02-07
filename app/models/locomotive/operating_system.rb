module Locomotive
  class OperatingSystem
    include DataMapper::Resource

    property :id,          Serial
    property :name,        String, :nullable => false
    property :vendor_name, String

    has n, :servers

  end
end
