require 'test_helper'

class ApplicationInstancesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:application_instances)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_application_instance
    assert_difference('ApplicationInstance.count') do
      post :create, :application_instance => { }
    end

    assert_redirected_to application_instance_path(assigns(:application_instance))
  end

  def test_should_show_application_instance
    get :show, :id => application_instances(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => application_instances(:one).id
    assert_response :success
  end

  def test_should_update_application_instance
    put :update, :id => application_instances(:one).id, :application_instance => { }
    assert_redirected_to application_instance_path(assigns(:application_instance))
  end

  def test_should_destroy_application_instance
    assert_difference('ApplicationInstance.count', -1) do
      delete :destroy, :id => application_instances(:one).id
    end

    assert_redirected_to application_instances_path
  end
end
