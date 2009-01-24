require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a dependency exists" do
  Dependency.all.destroy!
  request(resource(:dependencies), :method => "POST", 
    :params => { :dependency => { :id => nil }})
end

describe "resource(:dependencies)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:dependencies))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of dependencies" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a dependency exists" do
    before(:each) do
      @response = request(resource(:dependencies))
    end
    
    it "has a list of dependencies" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Dependency.all.destroy!
      @response = request(resource(:dependencies), :method => "POST", 
        :params => { :dependency => { :id => nil }})
    end
    
    it "redirects to resource(:dependencies)" do
      @response.should redirect_to(resource(Dependency.first), :message => {:notice => "dependency was successfully created"})
    end
    
  end
end

describe "resource(@dependency)" do 
  describe "a successful DELETE", :given => "a dependency exists" do
     before(:each) do
       @response = request(resource(Dependency.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:dependencies))
     end

   end
end

describe "resource(:dependencies, :new)" do
  before(:each) do
    @response = request(resource(:dependencies, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@dependency, :edit)", :given => "a dependency exists" do
  before(:each) do
    @response = request(resource(Dependency.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@dependency)", :given => "a dependency exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Dependency.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @dependency = Dependency.first
      @response = request(resource(@dependency), :method => "PUT", 
        :params => { :dependency => {:id => @dependency.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@dependency))
    end
  end
  
end

