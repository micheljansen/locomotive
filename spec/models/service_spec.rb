require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Service do
  
  class SpecServiceType < ServiceType
  end
  
  it "should not be valid without a service_type" do
    invalid_service = Service.new
    invalid_service.should_not be_valid
  end
  
  it "should not be valid with a nonexisting service_type" do
    invalid_service = Service.new(:service_type_type => "NonExistingServiceType")
    invalid_service.should_not be_valid
  end
  
  it "should be valid with an existing service_type" do
    valid_service = Service.new(:service_type_type => "SpecServiceType")
    valid_service.should be_valid
  end
  
end