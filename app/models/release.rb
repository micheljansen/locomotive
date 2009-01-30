class Release
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :created_at, DateTime
  property :updated_at, DateTime
  property :service_id, Integer

  belongs_to :service
  has n, :service_instances

  validates_present :service_id, :message => "unknown for this release"

  def full_name
    "#{service.name} #{name}"
  end

end
