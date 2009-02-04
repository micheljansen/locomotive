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

end
