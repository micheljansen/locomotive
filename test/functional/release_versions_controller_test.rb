require 'test_helper'

class ReleaseVersionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:release_versions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_release_version
    assert_difference('ReleaseVersion.count') do
      post :create, :release_version => { }
    end

    assert_redirected_to release_version_path(assigns(:release_version))
  end

  def test_should_show_release_version
    get :show, :id => release_versions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => release_versions(:one).id
    assert_response :success
  end

  def test_should_update_release_version
    put :update, :id => release_versions(:one).id, :release_version => { }
    assert_redirected_to release_version_path(assigns(:release_version))
  end

  def test_should_destroy_release_version
    assert_difference('ReleaseVersion.count', -1) do
      delete :destroy, :id => release_versions(:one).id
    end

    assert_redirected_to release_versions_path
  end
end
