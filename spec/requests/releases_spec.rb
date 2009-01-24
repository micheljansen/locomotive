require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Releases do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:releases)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_release" do
    assert_difference('Release.count') do
      post :create, :release => { }
    end

    assert_redirected_to release_path(assigns(:release))
  end

  it "should_show_release" do
    get :show, :id => releases(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => releases(:one).id
    assert_response :success
  end

  it "should_update_release" do
    put :update, :id => releases(:one).id, :release => { }
    assert_redirected_to release_path(assigns(:release))
  end

  it "should_destroy_release" do
    assert_difference('Release.count', -1) do
      delete :destroy, :id => releases(:one).id
    end

    assert_redirected_to releases_path
  end
end
