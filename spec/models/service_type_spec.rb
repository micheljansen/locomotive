require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class SpecServiceType < Locomotive::ServiceType
end

class SpecSubServiceType < SpecServiceType
end

describe Locomotive::ServiceType do

  before(:each) do
  end

  it "should know of direct subclass service types" do
    Locomotive::ServiceType.known_service_types.should include(SpecServiceType)
  end

  it "should know of service types that are subclasses of other service types" do
    Locomotive::ServiceType.known_service_types.should include(SpecSubServiceType)
  end

  it "should be able to have dependencies" do

    class DependingServiceType < Locomotive::ServiceType
      depends_on "appserver"
    end

    DependingServiceType.dependency_names.should include("appserver")
  end


end
