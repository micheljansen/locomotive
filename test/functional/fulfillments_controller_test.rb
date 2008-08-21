require 'test_helper'

class FulfillmentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:fulfillments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_fulfillment
    assert_difference('Fulfillment.count') do
      post :create, :fulfillment => { }
    end

    assert_redirected_to fulfillment_path(assigns(:fulfillment))
  end

  def test_should_show_fulfillment
    get :show, :id => fulfillments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => fulfillments(:one).id
    assert_response :success
  end

  def test_should_update_fulfillment
    put :update, :id => fulfillments(:one).id, :fulfillment => { }
    assert_redirected_to fulfillment_path(assigns(:fulfillment))
  end

  def test_should_destroy_fulfillment
    assert_difference('Fulfillment.count', -1) do
      delete :destroy, :id => fulfillments(:one).id
    end

    assert_redirected_to fulfillments_path
  end
end
