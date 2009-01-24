require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a service_instance exists" do
  ServiceInstance.all.destroy!
  request(resource(:service_instances), :method => "POST", 
    :params => { :service_instance => { :id => nil }})
end

describe "resource(:service_instances)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:service_instances))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of service_instances" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a service_instance exists" do
    before(:each) do
      @response = request(resource(:service_instances))
    end
    
    it "has a list of service_instances" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      ServiceInstance.all.destroy!
      @response = request(resource(:service_instances), :method => "POST", 
        :params => { :service_instance => { :id => nil }})
    end
    
    it "redirects to resource(:service_instances)" do
      @response.should redirect_to(resource(ServiceInstance.first), :message => {:notice => "service_instance was successfully created"})
    end
    
  end
end

describe "resource(@service_instance)" do 
  describe "a successful DELETE", :given => "a service_instance exists" do
     before(:each) do
       @response = request(resource(ServiceInstance.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:service_instances))
     end

   end
end

describe "resource(:service_instances, :new)" do
  before(:each) do
    @response = request(resource(:service_instances, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@service_instance, :edit)", :given => "a service_instance exists" do
  before(:each) do
    @response = request(resource(ServiceInstance.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@service_instance)", :given => "a service_instance exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(ServiceInstance.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @service_instance = ServiceInstance.first
      @response = request(resource(@service_instance), :method => "PUT", 
        :params => { :service_instance => {:id => @service_instance.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@service_instance))
    end
  end
  
end

