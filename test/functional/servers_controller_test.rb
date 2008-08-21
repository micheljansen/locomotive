require 'test_helper'

class ServersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:servers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_server
    assert_difference('Server.count') do
      post :create, :server => { }
    end

    assert_redirected_to server_path(assigns(:server))
  end

  def test_should_show_server
    get :show, :id => servers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => servers(:one).id
    assert_response :success
  end

  def test_should_update_server
    put :update, :id => servers(:one).id, :server => { }
    assert_redirected_to server_path(assigns(:server))
  end

  def test_should_destroy_server
    assert_difference('Server.count', -1) do
      delete :destroy, :id => servers(:one).id
    end

    assert_redirected_to servers_path
  end
end
