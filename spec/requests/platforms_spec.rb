require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a platform exists" do
  Locomotive::Platform.all.destroy!
  request(resource(:platforms), :method => "POST",
    :params => { :platform => { :id => nil, :name => 'Mac OS X 10.5' }})
end

describe "resource(:platforms)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(:platforms))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of platforms" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a platform exists" do
    before(:each) do
      @response = request(resource(:platforms))
    end

    it "has a list of platforms" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Locomotive::Platform.all.destroy!
      @response = request(resource(:platforms), :method => "POST",
        :params => { :platform => { :id => nil, :name => 'Ubuntu 8.10' }})
    end

    it "redirects to resource(:platforms)" do
      @response.should redirect_to(resource(Locomotive::Platform.first), :message => {:notice => "platform was successfully created"})
    end

  end
end

describe "resource(@platform)" do
  describe "a successful DELETE", :given => "a platform exists" do
     before(:each) do
       @response = request(resource(Locomotive::Platform.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:platforms))
     end

   end
end

describe "resource(:platforms, :new)" do
  before(:each) do
    @response = request(resource(:platforms, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@platform, :edit)", :given => "a platform exists" do
  before(:each) do
    @response = request(resource(Locomotive::Platform.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@platform)", :given => "a platform exists" do

  describe "GET" do
    before(:each) do
      @response = request(resource(Locomotive::Platform.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @platform = Locomotive::Platform.first
      @response = request(resource(@platform), :method => "PUT",
        :params => { :platform => {:id => @platform.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@platform))
    end
  end

end

