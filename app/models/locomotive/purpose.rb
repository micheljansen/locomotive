module Locomotive
  class Purpose
    include DataMapper::Resource

    property :id,         Serial
    property :role_id,    Integer
    property :system_id,  Integer

    timestamps :on

    belongs_to :role
    belongs_to :system

    validates_is_unique :role_id, :scope => :system_id,
                            :message => "already assigned to this server."
  end
end
