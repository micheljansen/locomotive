require 'test_helper'

class DependenciesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:dependencies)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_dependency
    assert_difference('Dependency.count') do
      post :create, :dependency => { }
    end

    assert_redirected_to dependency_path(assigns(:dependency))
  end

  def test_should_show_dependency
    get :show, :id => dependencies(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => dependencies(:one).id
    assert_response :success
  end

  def test_should_update_dependency
    put :update, :id => dependencies(:one).id, :dependency => { }
    assert_redirected_to dependency_path(assigns(:dependency))
  end

  def test_should_destroy_dependency
    assert_difference('Dependency.count', -1) do
      delete :destroy, :id => dependencies(:one).id
    end

    assert_redirected_to dependencies_path
  end
end
