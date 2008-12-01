require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/spec_test_plugin')

describe Locomotive::Plugin do
  
  before(:each) do
    @spec_plugin = Locomotive::Plugin.find_by_id("spec_test_plugin")
  end
=begin  
  it "should be able to find registered plugins" do
    Locomotive::Plugin.find_by_id("spec_test_plugin").should_not be_nil
    Locomotive::Plugin.all_ids.should include("spec_test_plugin")
    Locomotive::Plugin.find_all.should include(@spec_plugin)
  end
  
  it "should have all attributes that were set" do
    @spec_plugin.short_name.should == "spec_test_plugin"
    @spec_plugin.long_name.should == "Plugin for use in RSpec"
    @spec_plugin.version.should == 123
    @spec_plugin.description.should == "This one is only used during testing"
  end
  
  it "should have all properties that were set" do
    @spec_plugin.unchecked_without_anything.should be_nil
    @spec_plugin.unchecked_without_defaults.should be_nil
    @spec_plugin.unchecked_with_defaults.should == "default_value"
    @spec_plugin.checked_with_defaults.should == "valid"
    @spec_plugin.invalid_checked_with_defaults == "invalid1"
  end
  
=end
end