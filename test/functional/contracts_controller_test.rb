require 'test_helper'

class ContractsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:contracts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_contract
    assert_difference('Contract.count') do
      post :create, :contract => { }
    end

    assert_redirected_to contract_path(assigns(:contract))
  end

  def test_should_show_contract
    get :show, :id => contracts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => contracts(:one).id
    assert_response :success
  end

  def test_should_update_contract
    put :update, :id => contracts(:one).id, :contract => { }
    assert_redirected_to contract_path(assigns(:contract))
  end

  def test_should_destroy_contract
    assert_difference('Contract.count', -1) do
      delete :destroy, :id => contracts(:one).id
    end

    assert_redirected_to contracts_path
  end
end
