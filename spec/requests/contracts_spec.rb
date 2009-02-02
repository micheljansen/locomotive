require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a contract exists" do
  Contract.all.destroy!
  request(resource(@client, :contracts), :method => "POST",
    :params => { :contract => { :id => nil }})
end

describe "resource(@client, :contracts)" do
  describe "GET" do

    before(:each) do
      @response = request(resource(@client, :contracts))
    end

    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of contracts" do
      pending
      @response.should have_xpath("//ul")
    end

  end

  describe "GET", :given => "a contract exists" do
    before(:each) do
      @response = request(resource(@client, :contracts))
    end

    it "has a list of contracts" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end

  describe "a successful POST" do
    before(:each) do
      Contract.all.destroy!
      @response = request(resource(@client, :contracts), :method => "POST",
        :params => { :contract => { :id => nil }})
    end

    it "redirects to resource(@client, :contracts)" do
      @response.should redirect_to(resource(Contract.first), :message => {:notice => "contract was successfully created"})
    end

  end
end

describe "resource(@client, @contract)" do
  describe "a successful DELETE", :given => "a contract exists" do
     before(:each) do
       @response = request(resource(Contract.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(@client, :contracts))
     end

   end
end

describe "resource(@client, :contracts, :new)" do
  before(:each) do
    @response = request(resource(@client, :contracts, :new))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@client, @contract, :edit)", :given => "a contract exists" do
  before(:each) do
    @response = request(resource(Contract.first, :edit))
  end

  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@client, @contract)", :given => "a contract exists" do

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
      @contract = Contract.first
      @response = request(resource(@client, @contract), :method => "PUT",
        :params => { :contract => {:id => @contract.id} })
    end

    it "redirect to the article show action" do
      @response.should redirect_to(resource(@client, @contract))
    end
  end

end

