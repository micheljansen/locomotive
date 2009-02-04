require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a plugin_instance exists" do
  Locomotive::PluginInstance.all.destroy!
  request(resource(:plugin_instances), :method => "POST",
    :params => { :plugin_instance => { :id => nil }})
end

describe "resource(:plugin_instances)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(:plugin_instances))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of plugin_instances" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a plugin_instance exists" do
    before(:each) do
      @response = request(resource(:plugin_instances))
    end

    it "has a list of plugin_instances" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Locomotive::PluginInstance.all.destroy!
      @response = request(resource(:plugin_instances), :method => "POST",
        :params => { :plugin_instance => { :id => nil }})
    end

    it "redirects to resource(:plugin_instances)" do
      @response.should redirect_to(resource(Locomotive::PluginInstance.first), :message => {:notice => "plugin_instance was successfully created"})
    end

  end
end

describe "resource(@plugin_instance)" do
  describe "a successful DELETE", :given => "a plugin_instance exists" do
     before(:each) do
       @response = request(resource(Locomotive::PluginInstance.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:plugin_instances))
     end

   end
end

describe "resource(:plugin_instances, :new)" do
  before(:each) do
    @response = request(resource(:plugin_instances, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@plugin_instance, :edit)", :given => "a plugin_instance exists" do
  before(:each) do
    @response = request(resource(Locomotive::PluginInstance.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@plugin_instance)", :given => "a plugin_instance exists" do

  describe "GET" do
    before(:each) do
      @response = request(resource(Locomotive::PluginInstance.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @plugin_instance = Locomotive::PluginInstance.first
      @response = request(resource(@plugin_instance), :method => "PUT",
        :params => { :plugin_instance => {:id => @plugin_instance.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@plugin_instance))
    end
  end

end

