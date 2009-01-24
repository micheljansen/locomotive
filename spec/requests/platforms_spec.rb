require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a platform exists" do
  Platform.all.destroy!
  request(resource(:platforms), :method => "POST", 
    :params => { :platform => { :id => nil }})
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
      Platform.all.destroy!
      @response = request(resource(:platforms), :method => "POST", 
        :params => { :platform => { :id => nil }})
    end
    
    it "redirects to resource(:platforms)" do
      @response.should redirect_to(resource(Platform.first), :message => {:notice => "platform was successfully created"})
    end
    
  end
end

describe "resource(@platform)" do 
  describe "a successful DELETE", :given => "a platform exists" do
     before(:each) do
       @response = request(resource(Platform.first), :method => "DELETE")
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
    @response = request(resource(Platform.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@platform)", :given => "a platform exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Platform.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @platform = Platform.first
      @response = request(resource(@platform), :method => "PUT", 
        :params => { :platform => {:id => @platform.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@platform))
    end
  end
  
end

