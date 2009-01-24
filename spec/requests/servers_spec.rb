require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Servers do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:servers)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_server" do
    assert_difference('Server.count') do
      post :create, :server => { }
    end

    assert_redirected_to server_path(assigns(:server))
  end

  it "should_show_server" do
    get :show, :id => servers(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => servers(:one).id
    assert_response :success
  end

  it "should_update_server" do
    put :update, :id => servers(:one).id, :server => { }
    assert_redirected_to server_path(assigns(:server))
  end

  it "should_destroy_server" do
    assert_difference('Server.count', -1) do
      delete :destroy, :id => servers(:one).id
    end

    assert_redirected_to servers_path
  end
end
