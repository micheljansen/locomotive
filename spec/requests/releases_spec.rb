require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a release exists" do
  Locomotive::Release.all.destroy!
  request(resource(@service, :releases), :method => "POST",
    :params => { :release => { :id => nil }})
end

describe "resource(@service, :releases)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(@service, :releases))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of releases" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a release exists" do
    before(:each) do
      @response = request(resource(@service, :releases))
    end

    it "has a list of releases" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Locomotive::Release.all.destroy!
      @response = request(resource(@service, :releases), :method => "POST",
        :params => { :release => { :id => nil }})
    end

    it "redirects to resource(@service, :releases)" do
      @response.should redirect_to(resource(Locomotive::Release.first), :message => {:notice => "release was successfully created"})
    end

  end
end

describe "resource(@service, @release)" do
  describe "a successful DELETE", :given => "a release exists" do
     before(:each) do
       @response = request(resource(Locomotive::Release.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(@service, :releases))
     end

   end
end

describe "resource(@service, :releases, :new)" do
  before(:each) do
    @response = request(resource(@service, :releases, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@service, @release, :edit)", :given => "a release exists" do
  before(:each) do
    @response = request(resource(Locomotive::Release.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@service, @release)", :given => "a release exists" do

  describe "GET" do
    before(:each) do
      @response = request(resource(Locomotive::Release.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @release = Locomotive::Release.first
      @response = request(resource(@service, @release), :method => "PUT",
        :params => { :release => {:id => @release.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@service, @release))
    end
  end

end

