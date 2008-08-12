require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_client
    assert_difference('Client.count') do
      post :create, :client => { }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  def test_should_show_client
    get :show, :id => clients(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => clients(:one).id
    assert_response :success
  end

  def test_should_update_client
    put :update, :id => clients(:one).id, :client => { }
    assert_redirected_to client_path(assigns(:client))
  end

  def test_should_destroy_client
    assert_difference('Client.count', -1) do
      delete :destroy, :id => clients(:one).id
    end

    assert_redirected_to clients_path
  end
end
