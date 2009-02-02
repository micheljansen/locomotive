require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a plugin_property exists" do
  PluginProperty.all.destroy!
  request(resource(:plugin_properties), :method => "POST",
    :params => { :plugin_property => { :id => nil }})
end

describe "resource(:plugin_properties)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(:plugin_properties))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of plugin_properties" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a plugin_property exists" do
    before(:each) do
      @response = request(resource(:plugin_properties))
    end

    it "has a list of plugin_properties" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      PluginProperty.all.destroy!
      @response = request(resource(:plugin_properties), :method => "POST",
        :params => { :plugin_property => { :id => nil }})
    end

    it "redirects to resource(:plugin_properties)" do
      @response.should redirect_to(resource(PluginProperty.first), :message => {:notice => "plugin_property was successfully created"})
    end

  end
end

describe "resource(@plugin_property)" do
  describe "a successful DELETE", :given => "a plugin_property exists" do
     before(:each) do
       @response = request(resource(PluginProperty.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:plugin_properties))
     end

   end
end

describe "resource(:plugin_properties, :new)" do
  before(:each) do
    @response = request(resource(:plugin_properties, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@plugin_property, :edit)", :given => "a plugin_property exists" do
  before(:each) do
    @response = request(resource(PluginProperty.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@plugin_property)", :given => "a plugin_property exists" do

  describe "GET" do
    before(:each) do
      @response = request(resource(PluginProperty.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @plugin_property = PluginProperty.first
      @response = request(resource(@plugin_property), :method => "PUT",
        :params => { :plugin_property => {:id => @plugin_property.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@plugin_property))
    end
  end

end

