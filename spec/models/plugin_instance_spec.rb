require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

module PluginSetup
  def setup_plugin_instance
    @plugin = mock("plugin")
  end
end

#context "A Plugin Instance" do
  
  describe PluginInstance do
    before(:each) do
      @plugin_instance = PluginInstance.new
    end

    it "should be invalid wihout an existing plugin_type" do
      @plugin_instance.should_not be_valid
    end
  end
#end