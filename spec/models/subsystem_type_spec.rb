require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Locomotive::SubsystemType do

  it 'should not be valid without a name' do
    subsystem_type = Locomotive::SubsystemType.new
    subsystem_type.should_not be_valid
  end

end
