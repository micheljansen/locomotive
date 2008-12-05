require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  
  it "should not be valid without a name" do
    unnamed_client = Client.new
    unnamed_client.should_not be_valid
  end
  
  it "should be valid with a name" do
    client = Client.new(:name => "test")
    client.should be_valid
  end
  
end