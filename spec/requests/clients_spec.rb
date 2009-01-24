require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Clients do 
 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_client" do
    assert_difference('Client.count') do
      post :create, :client => { }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  it "should_show_client" do
    get :show, :id => clients(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => clients(:one).id
    assert_response :success
  end

  it "should_update_client" do
    put :update, :id => clients(:one).id, :client => { }
    assert_redirected_to client_path(assigns(:client))
  end

  it "should_destroy_client" do
    assert_difference('Client.count', -1) do
      delete :destroy, :id => clients(:one).id
    end

    assert_redirected_to clients_path
  end
end
