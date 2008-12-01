require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServiceInstance do
  
  before(:each) do
    client  = Client.create(:name => "henk", :description => "test")
    service = client.services.create(:name => "testservice")
    release = service.releases.create(:name => "release")
    @valid_service_instance = release.service_instances.create(:client => client)
    @valid_service_instance.platform = Platform.new
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
  
end
