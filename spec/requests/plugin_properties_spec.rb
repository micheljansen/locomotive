require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PluginProperties do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plugin_properties)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_plugin_property" do
    assert_difference('PluginProperty.count') do
      post :create, :plugin_property => { }
    end

    assert_redirected_to plugin_property_path(assigns(:plugin_property))
  end

  it "should_show_plugin_property" do
    get :show, :id => plugin_properties(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => plugin_properties(:one).id
    assert_response :success
  end

  it "should_update_plugin_property" do
    put :update, :id => plugin_properties(:one).id, :plugin_property => { }
    assert_redirected_to plugin_property_path(assigns(:plugin_property))
  end

  it "should_destroy_plugin_property" do
    assert_difference('PluginProperty.count', -1) do
      delete :destroy, :id => plugin_properties(:one).id
    end

    assert_redirected_to plugin_properties_path
  end
end
