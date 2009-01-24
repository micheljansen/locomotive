require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PluginInstances do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plugin_instances)
  end

  it "should_get_new" do
    get :new, :id => "hello_world"
    assert_response :success
  end

  it "should_create_plugin_instance" do
    assert_difference('PluginInstance.count') do
      post :create, :plugin_instance => { :plugin_type => "hello_world", :name => "hello_world_instance_1", :version => "1337" }
    end

    #assert_redirected_to plugin_instance_path(assigns(:plugin_instance))
  end

  it "should_show_plugin_instance" do
    get :show, :id => plugin_instances(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => plugin_instances(:one).id
    assert_response :success
  end

#  it "should_update_plugin_instance" do
#    put :update, :id => plugin_instances(:one).id, 
#                :plugin_instance => { :name => "new name"}
#    assert_redirected_to plugin_instance_path(assigns(:plugin_instance))
#  end

  it "should_destroy_plugin_instance" do
    assert_difference('PluginInstance.count', -1) do
      delete :destroy, :id => plugin_instances(:one).id
    end

    assert_redirected_to plugin_instances_path
  end
end
