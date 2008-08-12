require 'test_helper'

class ServiceInstancesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:service_instances)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_service_instance
    assert_difference('ServiceInstance.count') do
      post :create, :service_instance => { }
    end

    assert_redirected_to service_instance_path(assigns(:service_instance))
  end

  def test_should_show_service_instance
    get :show, :id => service_instances(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => service_instances(:one).id
    assert_response :success
  end

  def test_should_update_service_instance
    put :update, :id => service_instances(:one).id, :service_instance => { }
    assert_redirected_to service_instance_path(assigns(:service_instance))
  end

  def test_should_destroy_service_instance
    assert_difference('ServiceInstance.count', -1) do
      delete :destroy, :id => service_instances(:one).id
    end

    assert_redirected_to service_instances_path
  end
end
