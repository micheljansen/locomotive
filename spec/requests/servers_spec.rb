require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a server exists" do
  Server.all.destroy!
  request(resource(:servers), :method => "POST", 
    :params => { :server => { :id => nil }})
end

describe "resource(:servers)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:servers))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of servers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a server exists" do
    before(:each) do
      @response = request(resource(:servers))
    end
    
    it "has a list of servers" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Server.all.destroy!
      @response = request(resource(:servers), :method => "POST", 
        :params => { :server => { :id => nil }})
    end
    
    it "redirects to resource(:servers)" do
      @response.should redirect_to(resource(Server.first), :message => {:notice => "server was successfully created"})
    end
    
  end
end

describe "resource(@server)" do 
  describe "a successful DELETE", :given => "a server exists" do
     before(:each) do
       @response = request(resource(Server.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:servers))
     end

   end
end

describe "resource(:servers, :new)" do
  before(:each) do
    @response = request(resource(:servers, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@server, :edit)", :given => "a server exists" do
  before(:each) do
    @response = request(resource(Server.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@server)", :given => "a server exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Server.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @server = Server.first
      @response = request(resource(@server), :method => "PUT", 
        :params => { :server => {:id => @server.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@server))
    end
  end
  
end

