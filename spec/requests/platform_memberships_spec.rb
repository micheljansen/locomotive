require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a platform_membership exists" do
  Contract.all.destroy!
  request(resource(@platform, :platform_memberships), :method => "POST", 
    :params => { :platform_membership => { :id => nil }})
end

describe "resource(@platform, :platform_memberships)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(@platform, :platform_memberships))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of platform_memberships" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a platform_membership exists" do
    before(:each) do
      @response = request(resource(@platform, :platform_memberships))
    end
    
    it "has a list of platform_memberships" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Contract.all.destroy!
      @response = request(resource(@platform, :platform_memberships), :method => "POST", 
        :params => { :platform_membership => { :id => nil }})
    end
    
    it "redirects to resource(@platform, :platform_memberships)" do
      @response.should redirect_to(resource(Contract.first), :message => {:notice => "platform_membership was successfully created"})
    end
    
  end
end

describe "resource(@platform, @platform_membership)" do 
  describe "a successful DELETE", :given => "a platform_membership exists" do
     before(:each) do
       @response = request(resource(Contract.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(@platform, :platform_memberships))
     end

   end
end

describe "resource(@platform, :platform_memberships, :new)" do
  before(:each) do
    @response = request(resource(@platform, :platform_memberships, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@platform, @platform_membership, :edit)", :given => "a platform_membership exists" do
  before(:each) do
    @response = request(resource(Contract.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@platform, @platform_membership)", :given => "a platform_membership exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Contract.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @platform_membership = Contract.first
      @response = request(resource(@platform, @platform_membership), :method => "PUT", 
        :params => { :platform_membership => {:id => @platform_membership.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@platform, @platform_membership))
    end
  end
  
end

