module Locomotive
  class Contract
    include DataMapper::Resource

    property :id,         Serial
    property :client_id,  Integer, :index => true
    property :service_id, Integer, :index => true

    timestamps :on

    belongs_to :client
    belongs_to :service

    validates_present :client_id,  :with => [:create], :message => "can't be blank"
    validates_present :service_id, :with => [:create], :message => "can't be blank"
  end
end
