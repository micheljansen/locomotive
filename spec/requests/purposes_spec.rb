require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a purpose exists" do
  Locomotive::Purpose.all.destroy!
  request(resource(@system, :purposes), :method => "POST",
    :params => { :purpose => { :id => nil }})
end

describe "resource(@system, :purposes)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(@system, :purposes))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of purposes" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a purpose exists" do
    before(:each) do
      @response = request(resource(@system, :purposes))
    end

    it "has a list of purposes" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Locomotive::Purpose.all.destroy!
      @response = request(resource(@system, :purposes), :method => "POST",
        :params => { :purpose => { :id => nil }})
    end

    it "redirects to resource(@system, :purposes)" do
      @response.should redirect_to(resource(Locomotive::Purpose.first), :message => {:notice => "purpose was successfully created"})
    end

  end
end

describe "resource(@system, @purpose)" do
  describe "a successful DELETE", :given => "a purpose exists" do
     before(:each) do
       @response = request(resource(Locomotive::Purpose.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(@system, :purposes))
     end

   end
end

describe "resource(@system, :purposes, :new)" do
  before(:each) do
    @response = request(resource(@system, :purposes, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@system, @purpose, :edit)", :given => "a purpose exists" do
  before(:each) do
    @response = request(resource(Locomotive::Purpose.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@system, @purpose)", :given => "a purpose exists" do

  describe "GET" do
    before(:each) do
      @response = request(resource(Locomotive::Purpose.first))
    end

    it "responds successfully" do
      @response.should be_successful
    end
  end

  describe "PUT" do
    before(:each) do
      @purpose = Locomotive::Purpose.first
      @response = request(resource(@system, @purpose), :method => "PUT",
        :params => { :purpose => {:id => @purpose.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@system, @purpose))
    end
  end

end

