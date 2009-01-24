require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Roles do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_role" do
    assert_difference('Role.count') do
      post :create, :role => { }
    end

    assert_redirected_to role_path(assigns(:role))
  end

  it "should_show_role" do
    get :show, :id => roles(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => roles(:one).id
    assert_response :success
  end

  it "should_update_role" do
    put :update, :id => roles(:one).id, :role => { }
    assert_redirected_to role_path(assigns(:role))
  end

  it "should_destroy_role" do
    assert_difference('Role.count', -1) do
      delete :destroy, :id => roles(:one).id
    end

    assert_redirected_to roles_path
  end
end
