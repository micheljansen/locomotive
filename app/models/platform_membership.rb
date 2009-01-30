class PlatformMembership
  include DataMapper::Resource

  property :server_id, Integer
  property :platform_id, Integer

  timestamps :on

  belongs_to :server
  belongs_to :platform

  validates_present :server_id
  validates_present :platform_id

  # FIXME for DM: validates_associated :server, :on => :save
  # FIXME for DM: validates_associated :platform, :on => :save

  # workaround rails bug #5369
  # causing validates_associated not to fail on nonexisting id's
  # FIXME for DM:
  #validates_each :server, :platform do |record, attr, value|
  #     record.errors.add attr, 'is invalid' if value.nil?
  #end

  validates_is_unique :server_id, :scope => :platform_id,
                          :message => "already belongs to this platform"
end
