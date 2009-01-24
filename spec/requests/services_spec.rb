require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Services do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_service" do
    assert_difference('Service.count') do
      post :create, :service => { }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  it "should_show_service" do
    get :show, :id => services(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => services(:one).id
    assert_response :success
  end

  it "should_update_service" do
    put :update, :id => services(:one).id, :service => { }
    assert_redirected_to service_path(assigns(:service))
  end

  it "should_destroy_service" do
    assert_difference('Service.count', -1) do
      delete :destroy, :id => services(:one).id
    end

    assert_redirected_to services_path
  end
end
