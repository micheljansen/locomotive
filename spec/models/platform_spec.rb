require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Platform do
  
  before :each do
    @platforms =
      [ Platform.create(:name => "one"),
          Platform.create(:name => "two"),
            Platform.create(:name => "three") ]  
  end
  
  it "should not be valid without a name" do
    Platform.new(:name => "").should_not be_valid
  end
  
  it "should be valid with a name" do
    Platform.first(:name => "one").should be_valid
  end

  it "should have memberships for all associated servers" do
    server = Server.create(:name => "test", :hostname =>"test")
    @platforms[1].servers << server
    
    @platforms[1].platform_memberships.map {|m| m.server }.should include server
  end
  
  it "should be able to find memberships for associated server by id" do
    server = Server.create(:name => "test", :hostname =>"test")
    @platforms[1].servers << server
    
    @platforms[1].membership_for_server_id(server.id).should_not be_nil
  end
  
  it "should not have memberships for servers that are not associated" do
    server1 = Server.create(:name => "test1", :hostname =>"test1")
    @platforms[1].servers << server1
    
    server2 = Server.create(:name => "test2", :hostname =>"test2")
    @platforms[2].servers << server2
    
    @platforms[1].membership_for_server_id(server2.id).should be_nil
  end
  
  
end
