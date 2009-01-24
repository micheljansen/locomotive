require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Platforms do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:platform_memberships)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_platform_membership" do
    assert_difference('PlatformMembership.count') do
      post :create, :platform_membership => { }
    end

    assert_redirected_to platform_membership_path(assigns(:platform_membership))
  end

  it "should_show_platform_membership" do
    get :show, :id => platform_memberships(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => platform_memberships(:one).id
    assert_response :success
  end

  it "should_update_platform_membership" do
    put :update, :id => platform_memberships(:one).id, :platform_membership => { }
    assert_redirected_to platform_membership_path(assigns(:platform_membership))
  end

  it "should_destroy_platform_membership" do
    assert_difference('PlatformMembership.count', -1) do
      delete :destroy, :id => platform_memberships(:one).id
    end

    assert_redirected_to platform_memberships_path
  end
end
