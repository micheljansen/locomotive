require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Locomotive::Plugins do
  it "should_get_index" do
#    get :index
#    assert_response :success
#    assert_not_nil assigns(:plugins)
  end

  it "should_show_plugin" do
#    get :show, :id => "hello_world"
#    assert_response :success
  end
end

given "a plugin exists" do
#  Locomotive::Plugin.all.destroy!
#  request(resource(:plugins), :method => "POST",
#    :params => { :plugin => { :id => nil }})
end

describe "resource(:plugins)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(:plugins))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of plugins" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a plugin exists" do
    before(:each) do
      @response = request(resource(:plugins))
    end

    it "has a list of plugins" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
#      Locomotive::Plugin.all.destroy!
#      @response = request(resource(:plugins), :method => "POST",
#        :params => { :plugin => { :id => nil }})
    end

    it "redirects to resource(:plugins)" do
      pending
      @response.should redirect_to(resource(Locomotive::Plugin.first), :message => {:notice => "plugin was successfully created"})
    end

  end
end

describe "resource(@plugin)" do
  describe "a successful DELETE", :given => "a plugin exists" do
     before(:each) do
#       @response = request(resource(Locomotive::Plugin.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       pending
       @response.should redirect_to(resource(:plugins))
     end

   end
end

describe "resource(:plugins, :new)" do
  before(:each) do
#    @response = request(resource(:plugins, :new))
  end

  it "responds successfully" do
    pending
    @response.should be_successful
  end
end

describe "resource(@plugin, :edit)", :given => "a plugin exists" do
  before(:each) do
#    @response = request(resource(Locomotive::Plugin.first, :edit))
  end

  it "responds successfully" do
    pending
    @response.should be_successful
  end
end

describe "resource(@plugin)", :given => "a plugin exists" do

  describe "GET" do
    before(:each) do
#      @response = request(resource(Locomotive::Plugin.first))
    end

    it "responds successfully" do
      pending
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
#      @plugin = Locomotive::Plugin.first
#      @response = request(resource(@plugin), :method => "PUT",
#        :params => { :plugin => {:id => @plugin.id} })
    end

    it "redirect to the article show action" do
      pending
      @response.should redirect_to(resource(@plugin))
    end
  end

end

