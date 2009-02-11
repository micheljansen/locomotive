module Locomotive
  class ServerProcessor
    include DataMapper::Resource

    property :id, Serial
    property :system_id, Integer
    property :processor_id, Integer
    property :quantity, Integer
    property :cores,  Integer

#    belongs_to :server
#    belongs_to :processor

  end
end
