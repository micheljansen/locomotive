require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a system exists" do
  Locomotive::System.all.destroy!
  request(resource(:systems), :method => "POST",
    :params => { :system => { :id => nil,
    :name => 'Windows 2000',
    :hostname => 'zero-uptime' }})
end

describe "resource(:systems)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(:systems))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of systems" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a system exists" do
    before(:each) do
      @response = request(resource(:systems))
    end

    it "has a list of systems" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Locomotive::System.all.destroy!
      @response = request(resource(:systems), :method => "POST",
        :params => { :system => { :id => nil,
        :name => 'CentOS Box',
        :hostname => 'cien-porciento-uptime' }})
    end

    it "redirects to resource(:systems)" do
      @response.should redirect_to(resource(Locomotive::System.first), :message => {:notice => "system was successfully created"})
    end

  end
end

describe "resource(@system)" do
  describe "a successful DELETE", :given => "a system exists" do
     before(:each) do
       @response = request(resource(Locomotive::System.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:systems))
     end

   end
end

describe "resource(:systems, :new)" do
  before(:each) do
    @response = request(resource(:systems, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@system, :edit)", :given => "a system exists" do
  before(:each) do
    @response = request(resource(Locomotive::System.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@system)", :given => "a system exists" do

  describe "GET" do
    before(:each) do
      @response = request(resource(Locomotive::System.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @system = Locomotive::System.first
      @response = request(resource(@system), :method => "PUT",
        :params => { :system => {:id => @system.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@system))
    end
  end

end

