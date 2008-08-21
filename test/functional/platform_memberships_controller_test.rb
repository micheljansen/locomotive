require 'test_helper'

class PlatformMembershipsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:platform_memberships)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_platform_membership
    assert_difference('PlatformMembership.count') do
      post :create, :platform_membership => { }
    end

    assert_redirected_to platform_membership_path(assigns(:platform_membership))
  end

  def test_should_show_platform_membership
    get :show, :id => platform_memberships(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => platform_memberships(:one).id
    assert_response :success
  end

  def test_should_update_platform_membership
    put :update, :id => platform_memberships(:one).id, :platform_membership => { }
    assert_redirected_to platform_membership_path(assigns(:platform_membership))
  end

  def test_should_destroy_platform_membership
    assert_difference('PlatformMembership.count', -1) do
      delete :destroy, :id => platform_memberships(:one).id
    end

    assert_redirected_to platform_memberships_path
  end
end
