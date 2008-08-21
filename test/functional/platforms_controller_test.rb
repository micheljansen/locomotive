require 'test_helper'

class PlatformsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:platforms)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_platform
    assert_difference('Platform.count') do
      post :create, :platform => { }
    end

    assert_redirected_to platform_path(assigns(:platform))
  end

  def test_should_show_platform
    get :show, :id => platforms(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => platforms(:one).id
    assert_response :success
  end

  def test_should_update_platform
    put :update, :id => platforms(:one).id, :platform => { }
    assert_redirected_to platform_path(assigns(:platform))
  end

  def test_should_destroy_platform
    assert_difference('Platform.count', -1) do
      delete :destroy, :id => platforms(:one).id
    end

    assert_redirected_to platforms_path
  end
end
