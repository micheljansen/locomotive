require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_service
    assert_difference('Service.count') do
      post :create, :service => { }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  def test_should_show_service
    get :show, :id => services(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => services(:one).id
    assert_response :success
  end

  def test_should_update_service
    put :update, :id => services(:one).id, :service => { }
    assert_redirected_to service_path(assigns(:service))
  end

  def test_should_destroy_service
    assert_difference('Service.count', -1) do
      delete :destroy, :id => services(:one).id
    end

    assert_redirected_to services_path
  end
end
