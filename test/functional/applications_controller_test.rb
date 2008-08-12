require 'test_helper'

class ApplicationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:applications)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_application
    assert_difference('Application.count') do
      post :create, :application => { }
    end

    assert_redirected_to application_path(assigns(:application))
  end

  def test_should_show_application
    get :show, :id => applications(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => applications(:one).id
    assert_response :success
  end

  def test_should_update_application
    put :update, :id => applications(:one).id, :application => { }
    assert_redirected_to application_path(assigns(:application))
  end

  def test_should_destroy_application
    assert_difference('Application.count', -1) do
      delete :destroy, :id => applications(:one).id
    end

    assert_redirected_to applications_path
  end
end
