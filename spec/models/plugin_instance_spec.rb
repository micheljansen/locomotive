require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module PluginSetup
  def setup_plugin_instance
    @plugin = mock("plugin")
  end
end

#context "A Plugin Instance" do
  
  describe PluginInstance do
    before(:each) do
      # XXX: Causing "Stack level too deep" error - needs investigation
      # @plugin_instance = PluginInstance.new(:plugin_type => "spec_test_plugin")
    end

    it "should be invalid wihout an existing plugin_type" do
      pending
      @plugin_instance.should_not be_valid
    end
  end
#end
