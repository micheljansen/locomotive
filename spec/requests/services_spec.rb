require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a service exists" do
  Locomotive::Service.all.destroy!
  request(resource(:services), :method => "POST",
    :params => { :service => { :id => nil,
      :name => 'Example Locomotive::Service',
      :service_type_type => 'Example Type' }})
end

describe "resource(:services)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(:services))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of services" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a service exists" do
    before(:each) do
      @response = request(resource(:services))
    end

    it "has a list of services" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Locomotive::Service.all.destroy!
      @response = request(resource(:services), :method => "POST",
        :params => { :service => { :id => nil,
        :name => 'Example Locomotive::Service',
        :service_type_type => 'Example Type' }})
    end

    it "redirects to resource(:services)" do
      @response.should redirect_to(resource(Locomotive::Service.first), :message => {:notice => "service was successfully created"})
    end

  end
end

describe "resource(@service)" do
  describe "a successful DELETE", :given => "a service exists" do
     before(:each) do
       @response = request(resource(Locomotive::Service.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:services))
     end

   end
end

describe "resource(:services, :new)" do
  before(:each) do
    @response = request(resource(:services, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@service, :edit)", :given => "a service exists" do
  before(:each) do
    @response = request(resource(Locomotive::Service.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@service)", :given => "a service exists" do

  describe "GET" do
    before(:each) do
      @response = request(resource(Locomotive::Service.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @service = Locomotive::Service.first
      @response = request(resource(@service), :method => "PUT",
        :params => { :service => {:id => @service.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@service))
    end
  end

end

