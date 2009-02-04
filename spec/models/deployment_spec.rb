require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Locomotive::Deployment do

  class SpecServiceType < Locomotive::ServiceType
  end

  before(:each) do
    @client  = Locomotive::Client.create(:name => "henk", :description => "test")

    # The following shortcuts are not available to us in DM:
    # @service = @client.services.create(:name => "testservice", :service_type_type => "SpecServiceType")
    # @release = @service.releases.create(:name => "release")

    @service = Locomotive::Service.create(:name => "testservice", :service_type_type => "SpecServiceType")
    @client.contracts << @service

    @release = Locomotive::Release.create(:name => "release")
    @service.releases << @release

    @valid_deployment = Locomotive::Deployment.create(:client => @client)
    # @valid_deployment = @release.deployments.create(:client => @client)
    @valid_deployment.platform = Locomotive::Platform.new
    @valid_deployment.save
    @release.deployments << @valid_deployment
  end

  it "should be valid when provided with a valid release, client and platform" do
    puts "Errors: #{@valid_deployment.errors.full_messages}" if !@valid_deployment.valid?
    @valid_deployment.should be_valid
  end

  it "should not be valid without a release" do
    si_without_release = @valid_deployment
    si_without_release.release = nil
    si_without_release.should_not be_valid
  end

  it "should not be valid without a client" do
    si = Locomotive::Deployment.new(:release => Locomotive::Release.new, :platform => Locomotive::Platform.new)
    si.should_not be_valid
  end

  it "should not be valid without a platform" do
    si = Locomotive::Deployment.new(:client => Locomotive::Client.new, :release => Locomotive::Release.new)
    si.should_not be_valid
  end

  it "should not be valid when assigning a release the client has no contract for" do
    invalid_si = @valid_deployment
    invalid_si.client = Locomotive::Client.new

    invalid_si.should_not be_valid
  end

  it "should not be allowed to change service type" do
    si = @valid_deployment
    # unrelated_service = @client.services.create(:name => "completely_unrelated_service", :service_type_type => "SpecServiceType")
    # unrelated_release = unrelated_service.releases.create(:name => "test")
    unrelated_service = Locomotive::Service.create(:name => "completely_unrelated_service", :service_type_type => "SpecServiceType")
    @client.contracts << unrelated_service
    unrelated_release = Locomotive::Release.create(:name => "test")
    unrelated_service.releases << unrelated_release

    si.release = unrelated_release

    si.should_not be_valid
  end

end
