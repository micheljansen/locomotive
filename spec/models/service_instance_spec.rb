require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServiceInstance do
  
  before(:each) do
  end
  
  it "should not be valid without a release" do
    si = ServiceInstance.new(:client => Client.new, :platform => Platform.new)
    si.should_not be_valid
  end
  
  it "should not be valid without a client" do
    si = ServiceInstance.new(:release => Release.new, :platform => Platform.new)
    si.should_not be_valid
  end
  
  it "should not be valid without a platform" do
    si = ServiceInstance.new(:client => Client.new, :release => Release.new)
    si.should_not be_valid
  end
  
  it "should be valid when provided with a release, client and platform" do
      client  = Client.create(:name => "henk", :description => "test")
      service = Service.create(:name => "testservice")
      release = service.releases.create(:name => "release")
      service_instance = release.service_instances.create(:client => client)
      service_instance.platform = Platform.new
  end
  
end
