require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Locomotive::Processor do

  it 'should not be valid without a name' do
    processor = Locomotive::Processor.new
    processor.should_not be_valid
  end

  it 'should be valid with a name' do
    processor = Locomotive::Processor.new
    processor.name = 'Core Duo'
    processor.should be_valid
  end

end
