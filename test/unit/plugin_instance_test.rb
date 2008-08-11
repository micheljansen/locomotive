require 'test_helper'

class PluginInstanceTest < ActiveSupport::TestCase
  
  def test_invalid_with_empty_attributes
    plugin_instance = PluginInstance.new
    assert !plugin_instance.valid?
    
    assert plugin_instance.errors.invalid?(:plugin_type)
    assert plugin_instance.errors.invalid?(:version)
    assert plugin_instance.errors.invalid?(:name)
  end
  
end
