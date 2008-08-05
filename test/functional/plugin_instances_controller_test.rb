require 'test_helper'

class PluginInstancesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:plugin_instances)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_plugin_instance
    assert_difference('PluginInstance.count') do
      post :create, :plugin_instance => { }
    end

    assert_redirected_to plugin_instance_path(assigns(:plugin_instance))
  end

  def test_should_show_plugin_instance
    get :show, :id => plugin_instances(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => plugin_instances(:one).id
    assert_response :success
  end

  def test_should_update_plugin_instance
    put :update, :id => plugin_instances(:one).id, :plugin_instance => { }
    assert_redirected_to plugin_instance_path(assigns(:plugin_instance))
  end

  def test_should_destroy_plugin_instance
    assert_difference('PluginInstance.count', -1) do
      delete :destroy, :id => plugin_instances(:one).id
    end

    assert_redirected_to plugin_instances_path
  end
end
