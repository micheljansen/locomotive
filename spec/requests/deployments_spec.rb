require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a deployment exists" do
  Deployment.all.destroy!
  request(resource(:deployments), :method => "POST", 
    :params => { :deployment => { :id => nil }})
end

describe "resource(:deployments)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:deployments))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of deployments" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a deployment exists" do
    before(:each) do
      @response = request(resource(:deployments))
    end
    
    it "has a list of deployments" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Deployment.all.destroy!
      @response = request(resource(:deployments), :method => "POST", 
        :params => { :deployment => { :id => nil }})
    end
    
    it "redirects to resource(:deployments)" do
      @response.should redirect_to(resource(Deployment.first), :message => {:notice => "deployment was successfully created"})
    end
    
  end
end

describe "resource(@deployment)" do 
  describe "a successful DELETE", :given => "a deployment exists" do
     before(:each) do
       @response = request(resource(Deployment.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:deployments))
     end

   end
end

describe "resource(:deployments, :new)" do
  before(:each) do
    @response = request(resource(:deployments, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@deployment, :edit)", :given => "a deployment exists" do
  before(:each) do
    @response = request(resource(Deployment.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@deployment)", :given => "a deployment exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Deployment.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @deployment = Deployment.first
      @response = request(resource(@deployment), :method => "PUT", 
        :params => { :deployment => {:id => @deployment.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@deployment))
    end
  end
  
end

