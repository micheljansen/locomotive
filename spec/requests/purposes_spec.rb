require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a purpose exists" do
  Locomotive::Purpose.all.destroy!
  request(resource(@server, :purposes), :method => "POST",
    :params => { :purpose => { :id => nil }})
end

describe "resource(@server, :purposes)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(@server, :purposes))
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
      @response = request(resource(@server, :purposes))
    end

    it "has a list of purposes" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Locomotive::Purpose.all.destroy!
      @response = request(resource(@server, :purposes), :method => "POST",
        :params => { :purpose => { :id => nil }})
    end

    it "redirects to resource(@server, :purposes)" do
      @response.should redirect_to(resource(Locomotive::Purpose.first), :message => {:notice => "purpose was successfully created"})
    end

  end
end

describe "resource(@server, @purpose)" do
  describe "a successful DELETE", :given => "a purpose exists" do
     before(:each) do
       @response = request(resource(Locomotive::Purpose.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(@server, :purposes))
     end

   end
end

describe "resource(@server, :purposes, :new)" do
  before(:each) do
    @response = request(resource(@server, :purposes, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@server, @purpose, :edit)", :given => "a purpose exists" do
  before(:each) do
    @response = request(resource(Locomotive::Purpose.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@server, @purpose)", :given => "a purpose exists" do

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
      @response = request(resource(@server, @purpose), :method => "PUT",
        :params => { :purpose => {:id => @purpose.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@server, @purpose))
    end
  end

end

