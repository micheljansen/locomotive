require 'test_helper'

class PluginsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:plugins)
  end

  def test_should_show_plugin
    get :show, :id => "hello_world"
    assert_response :success
  end
end
