require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Locomotive::Server do

  it "should not be valid without a name" do
    server = Locomotive::Server.new
    server.should_not be_valid
  end

  it "should be valid with a name and hostname" do
    server = Locomotive::Server.new
    server.name = 'Windows 2000'
    server.hostname = 'millenium-windoze'
    server.should be_valid
  end

  it 'should use the operating system name as its default name' do
    pending
  end

  describe 'hostname' do

    before(:each) do
      @server = Locomotive::Server.new
      @server.name = 'Ubuntu 8.10'
    end

    it 'should be greater than 2' do
      @server.hostname = 'u'
      @server.should_not be_valid
    end

    it 'should be less than 255' do
      @server.hostname = 'averylonghostnameforaveryexpensivebladeserverexceptthatithasahostnamethatdoesnotmeetthecriterialaiddownbyanrfc.whatreallyneedstohappenisthatitgetssentbacktothevendor.letsletouritmanagerknowaboutit-becauseitmanagersarereallygoodatbeingintheknow.ofcourseofcourseofcourseofcourse'
      @server.should_not be_valid
    end

    it 'should only contain ASCII characters A-Z, digits, or hyphens' do
      @server.hostname = '@!:<>?!"'
      @server.should_not be_valid
      @server.hostname = 'asa'
      @server.should be_valid
    end

    it 'should not begin or end with a hyphen' do
      pending "regex not yet picking up on this"
      @server.hostname = 'windows-box'
      @server.should be_valid
      @server.hostname = '-windows-box'
      @server.should be_valid
      @server.hostname = 'windows-box-'
      @server.should be_valid
    end

  end

  describe 'associations' do

    before(:each) do
      @server = Locomotive::Server.new
    end

    it 'should belong to an operating system' do
      @server.should respond_to(:operating_system)
    end

    it 'should have server processors' do
      @server.should respond_to(:server_processors)
    end

    it 'should have processors' do
      @server.should respond_to(:processors)
    end

    it 'should have subsystems' do
      @server.should respond_to(:subsystems)
      @server.should respond_to(:subsystems=)
      # subsystem = mock('subsystem')
      # @server.subsystems << subsystem
    end

    it 'should have platform memberships' do
      @server.should respond_to(:platform_memberships)
      @server.should respond_to(:platform_memberships=)
    end

    it 'should have platforms' do
      @server.should respond_to(:platforms)
    end

  end

end
