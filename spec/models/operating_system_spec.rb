require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Locomotive::OperatingSystem do

  it 'should not be valid without a name' do
    operating_system = Locomotive::OperatingSystem.new
    operating_system.should_not be_valid
  end

  it 'should be valid with a name' do
    operating_system = Locomotive::OperatingSystem.new
    operating_system.name = 'Windows 7'
    operating_system.should be_valid
  end

  describe 'associations' do

    it 'should have many servers' do
      operating_system = Locomotive::OperatingSystem.new
      operating_system.should respond_to(:systems)
      operating_system.should respond_to(:systems=)
    end

  end

end
