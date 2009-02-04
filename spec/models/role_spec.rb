require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Locomotive::Role do

  it "should not be valid without a name" do
    role = Locomotive::Role.new
    role.should_not be_valid
  end

  it "should be valid with a name and hostname" do
    role = Locomotive::Role.new
    role.name = 'Windows 2000'
    role.should be_valid
  end

end
