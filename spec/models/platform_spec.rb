require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Locomotive::Platform do

  before :each do
    @platforms =
      [ Locomotive::Platform.create(:name => "one"),
          Locomotive::Platform.create(:name => "two"),
            Locomotive::Platform.create(:name => "three") ]
  end

  it "should not be valid without a name" do
    Locomotive::Platform.new(:name => "").should_not be_valid
  end

  it "should be valid with a name" do
    Locomotive::Platform.first(:name => "one").should be_valid
  end

  it "should have memberships for all associated servers" do
    server = Locomotive::Server.create(:name => "test", :hostname =>"test")

    # @platforms[1].servers << server
    # (see ticket http://datamapper.lighthouseapp.com/projects/20609/tickets/485-has-n-through-does-not-allow-saving-of-model)
    @platforms[1].platform_memberships << server
    @platforms[1].platform_memberships.map.should include(server)
  end

  it "should be able to find memberships for associated server by id" do
    server = Locomotive::Server.create(:name => "test", :hostname =>"test")
    # @platforms[1].servers << server
    @platforms[1].platform_memberships << server

    @platforms[1].membership_for_server_id(server.id).should_not be_nil
  end

  it "should not have memberships for servers that are not associated" do
    server1 = Locomotive::Server.create(:name => "test1", :hostname =>"test1")
    # @platforms[1].servers << server1
    @platforms[1].platform_memberships << server1

    server2 = Locomotive::Server.create(:name => "test2", :hostname =>"test2")
    # @platforms[2].servers << server2
    @platforms[2].platform_memberships << server2

    @platforms[1].membership_for_server_id(server2.id).should be_nil
  end


end
