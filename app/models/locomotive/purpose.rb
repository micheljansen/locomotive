module Locomotive
  class Purpose
    include DataMapper::Resource

    property :id,         Serial
    property :role_id,    Integer
    property :server_id,  Integer

    timestamps :on

    belongs_to :role
    belongs_to :server

    validates_is_unique :role_id, :scope => :server_id,
                            :message => "already assigned to this server."
  end
end
