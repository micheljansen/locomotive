require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServiceInstances do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_instances)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_service_instance" do
    assert_difference('ServiceInstance.count') do
      post :create, :service_instance => { }
    end

    assert_redirected_to service_instance_path(assigns(:service_instance))
  end

  it "should_show_service_instance" do
    get :show, :id => service_instances(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => service_instances(:one).id
    assert_response :success
  end

  it "should_update_service_instance" do
    put :update, :id => service_instances(:one).id, :service_instance => { }
    assert_redirected_to service_instance_path(assigns(:service_instance))
  end

  it "should_destroy_service_instance" do
    assert_difference('ServiceInstance.count', -1) do
      delete :destroy, :id => service_instances(:one).id
    end

    assert_redirected_to service_instances_path
  end
end
