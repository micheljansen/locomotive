require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Locomotive::System do

  it "should not be valid without a name" do
    server = Locomotive::System.new
    server.should_not be_valid
  end

  it "should be valid with a name and hostname" do
    server = Locomotive::System.new
    server.name = 'Windows 2000'
    server.hostname = 'millenium-windoze'
    server.should be_valid
  end

  it 'should use the operating system name as its default name' do
    pending
  end

  describe 'hostname' do

    before(:each) do
      @system = Locomotive::System.new
      @system.name = 'Ubuntu 8.10'
    end

    it 'should be greater than 2' do
      @system.hostname = 'u'
      @system.should_not be_valid
    end

    it 'should be less than 255' do
      @system.hostname = 'averylonghostnameforaveryexpensivebladeserverexceptthatithasahostnamethatdoesnotmeetthecriterialaiddownbyanrfc.whatreallyneedstohappenisthatitgetssentbacktothevendor.letsletouritmanagerknowaboutit-becauseitmanagersarereallygoodatbeingintheknow.ofcourseofcourseofcourseofcourse'
      @system.should_not be_valid
    end

    it 'should only contain ASCII characters A-Z, digits, or hyphens' do
      @system.hostname = '@!:<>?!"'
      @system.should_not be_valid
      @system.hostname = 'asa'
      @system.should be_valid
    end

    it 'should not begin or end with a hyphen' do
      pending "regex not yet picking up on this"
      @system.hostname = 'windows-box'
      @system.should be_valid
      @system.hostname = '-windows-box'
      @system.should be_valid
      @system.hostname = 'windows-box-'
      @system.should be_valid
    end

  end

  describe 'associations' do

    before(:each) do
      @system = Locomotive::System.new
    end

    it 'should belong to an operating system' do
      @system.should respond_to(:operating_system)
    end

    it 'should have server processors' do
      pending 'refactor this relationship'
      # @system.should respond_to(:server_processors)
    end

    it 'should have processors' do
      pending 'refactor this relationship'
      # @system.should respond_to(:processors)
    end

    it 'should have subsystems' do
      @system.should respond_to(:subsystems)
      @system.should respond_to(:subsystems=)
      # subsystem = mock('subsystem')
      # @system.subsystems << subsystem
    end

    it 'should have platform memberships' do
      @system.should respond_to(:platform_memberships)
      @system.should respond_to(:platform_memberships=)
    end

    it 'should have platforms' do
      @system.should respond_to(:platforms)
    end

  end

end
