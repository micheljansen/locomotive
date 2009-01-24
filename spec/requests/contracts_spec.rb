require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contracts do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contracts)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_contract" do
    assert_difference('Contract.count') do
      post :create, :contract => { }
    end

    assert_redirected_to contract_path(assigns(:contract))
  end

  it "should_show_contract" do
    get :show, :id => contracts(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => contracts(:one).id
    assert_response :success
  end

  it "should_update_contract" do
    put :update, :id => contracts(:one).id, :contract => { }
    assert_redirected_to contract_path(assigns(:contract))
  end

  it "should_destroy_contract" do
    assert_difference('Contract.count', -1) do
      delete :destroy, :id => contracts(:one).id
    end

    assert_redirected_to contracts_path
  end
end
