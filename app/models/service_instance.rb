# == Schema Information
# Schema version: 20081201121936
#
# Table name: service_instances
#
#  id          :integer         not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  platform_id :integer
#  client_id   :integer
#  release_id  :integer
#

require 'release' # Related classes not loaded by Rails TODO: investigate this
require 'role'    # Related classes not loaded by Rails TODO: investigate this

class ServiceInstance
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :created_at, DateTime
  property :updated_at, DateTime
  property :platform_id, Integer
  property :client_id, Integer
  property :release_id, Integer

  belongs_to :release
  belongs_to :client
  belongs_to :platform

  validates_present :release, :on => :create, :message => "can't be blank"
  validates_present :client, :on => :create, :message => "can't be blank"
  validates_present :platform, :on => :create, :message => "can't be blank"

  validates_with_method :legal_release_for_client?
  validates_with_method :service_has_not_changed?

  def deploy
    # find the service_type to delegate this request to
    service_type = release.service.service_type
    puts "ServiceType: #{service_type.name}"
    service_type.deploy(self)
  end

  # convenience accessor to service through release
  def service
    release.service if release
  end


  private

  # Validation to check if the release associated with this ServiceInstance
  # is legal given the associated client.
  #
  # It does not make sense to have an instance of a service release that
  # the client does not have a contract for. This validation stops that.
  def legal_release_for_client?
    if(!release)
      errors.add(:release, "is not specified")
    elsif(!release.service)
      errors.add(:release, "does not belong to a service")
    elsif(!release.service.clients.include? client)
      errors.add(:release, "does not belong to a service client #{client.name ? client.name : nil} has a contract for.")
    end
  end

  # Validates on updating the release, whether that release belongs to the same
  # service as the previous one.
  def service_has_not_changed?
    if dirty?
                                        ## TODO: check this is being done correctly
      previous_release = Release.get(dirty_attributes[:release_id]) if dirty_attributes[:release_id]

      if previous_release && release && previous_release.service != release.service
        errors.add(:release, "belongs to a different service than this instance")
      end

    end
  end

end
