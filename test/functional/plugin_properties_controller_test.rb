require 'test_helper'

class PluginPropertiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:plugin_properties)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_plugin_property
    assert_difference('PluginProperty.count') do
      post :create, :plugin_property => { }
    end

    assert_redirected_to plugin_property_path(assigns(:plugin_property))
  end

  def test_should_show_plugin_property
    get :show, :id => plugin_properties(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => plugin_properties(:one).id
    assert_response :success
  end

  def test_should_update_plugin_property
    put :update, :id => plugin_properties(:one).id, :plugin_property => { }
    assert_redirected_to plugin_property_path(assigns(:plugin_property))
  end

  def test_should_destroy_plugin_property
    assert_difference('PluginProperty.count', -1) do
      delete :destroy, :id => plugin_properties(:one).id
    end

    assert_redirected_to plugin_properties_path
  end
end
