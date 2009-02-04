module Locomotive
  class Dependency
    include DataMapper::Resource

    property :id,         Serial
    property :role_id, Integer
    property :service_type_id, Integer

    timestamps :on

  end
end
