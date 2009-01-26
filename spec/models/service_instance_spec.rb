require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServiceInstance do
  
  class SpecServiceType < ServiceType
  end
  
  before(:each) do
    @client  = Client.create(:name => "henk", :description => "test")
    
    # The following shortcuts are not available to us in DM:
    # @service = @client.services.create(:name => "testservice", :service_type_type => "SpecServiceType")
    # @release = @service.releases.create(:name => "release")

    @service = Service.create(:name => "testservice", :service_type_type => "SpecServiceType")
    @client.contracts << @service

    @release = Release.create(:name => "release")
    @service.releases << @release

    @valid_service_instance = ServiceInstance.create(:client => @client)
    # @valid_service_instance = @release.service_instances.create(:client => @client)
    @valid_service_instance.platform = Platform.new
    @valid_service_instance.save
    @release.service_instances << @valid_service_instance
  end
  
  it "should be valid when provided with a valid release, client and platform" do
    puts "Errors: #{@valid_service_instance.errors.full_messages}" if !@valid_service_instance.valid?
    @valid_service_instance.should be_valid
  end
  
  it "should not be valid without a release" do
    si_without_release = @valid_service_instance
    si_without_release.release = nil
    si_without_release.should_not be_valid
  end
  
  it "should not be valid without a client" do
    si = ServiceInstance.new(:release => Release.new, :platform => Platform.new)
    si.should_not be_valid
  end
  
  it "should not be valid without a platform" do
    si = ServiceInstance.new(:client => Client.new, :release => Release.new)
    si.should_not be_valid
  end
  
  it "should not be valid when assigning a release the client has no contract for" do
    invalid_si = @valid_service_instance
    invalid_si.client = Client.new
    
    invalid_si.should_not be_valid
  end
  
  it "should not be allowed to change service type" do
    si = @valid_service_instance
    # unrelated_service = @client.services.create(:name => "completely_unrelated_service", :service_type_type => "SpecServiceType")
    # unrelated_release = unrelated_service.releases.create(:name => "test")
    unrelated_service = Service.create(:name => "completely_unrelated_service", :service_type_type => "SpecServiceType")
    @client.contracts << unrelated_service
    unrelated_release = Release.create(:name => "test")
    unrelated_service.releases << unrelated_release

    si.release = unrelated_release

    si.should_not be_valid
  end
  
end
