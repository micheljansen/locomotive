require 'test_helper'

class PurposesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:purposes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_purpose
    assert_difference('Purpose.count') do
      post :create, :purpose => { }
    end

    assert_redirected_to purpose_path(assigns(:purpose))
  end

  def test_should_show_purpose
    get :show, :id => purposes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => purposes(:one).id
    assert_response :success
  end

  def test_should_update_purpose
    put :update, :id => purposes(:one).id, :purpose => { }
    assert_redirected_to purpose_path(assigns(:purpose))
  end

  def test_should_destroy_purpose
    assert_difference('Purpose.count', -1) do
      delete :destroy, :id => purposes(:one).id
    end

    assert_redirected_to purposes_path
  end
end
