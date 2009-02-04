module Locomotive
  class Release
    include DataMapper::Resource

    property :id,         Serial
    property :name,       String
    property :service_id, Integer

    timestamps :on

    belongs_to :service
    has n, :deployments

    validates_present :service_id, :message => "unknown for this release"

    def full_name
      "#{service.name} #{name}"
    end

  end
end
