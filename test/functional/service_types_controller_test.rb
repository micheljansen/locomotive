require 'test_helper'

class ServiceTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:service_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_service_type
    assert_difference('ServiceType.count') do
      post :create, :service_type => { }
    end

    assert_redirected_to service_type_path(assigns(:service_type))
  end

  def test_should_show_service_type
    get :show, :id => service_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => service_types(:one).id
    assert_response :success
  end

  def test_should_update_service_type
    put :update, :id => service_types(:one).id, :service_type => { }
    assert_redirected_to service_type_path(assigns(:service_type))
  end

  def test_should_destroy_service_type
    assert_difference('ServiceType.count', -1) do
      delete :destroy, :id => service_types(:one).id
    end

    assert_redirected_to service_types_path
  end
end
