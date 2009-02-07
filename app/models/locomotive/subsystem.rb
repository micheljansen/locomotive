module Locomotive
  class Subsystem
    include DataMapper::Resource

    property :id,         Serial
    property :port,       Integer
    property :notes,      Text

    property :server_id,  Integer
    property :type_id,    Integer

    timestamps :on

    belongs_to :server
    belongs_to :type, :class_name => Locomotive::SubsystemType

   # validates_present [:server, :type]

  end
end
