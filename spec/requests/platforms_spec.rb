require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Platforms do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:platforms)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_platform" do
    assert_difference('Platform.count') do
      post :create, :platform => { }
    end

    assert_redirected_to platform_path(assigns(:platform))
  end

  it "should_show_platform" do
    get :show, :id => platforms(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => platforms(:one).id
    assert_response :success
  end

  it "should_update_platform" do
    put :update, :id => platforms(:one).id, :platform => { }
    assert_redirected_to platform_path(assigns(:platform))
  end

  it "should_destroy_platform" do
    assert_difference('Platform.count', -1) do
      delete :destroy, :id => platforms(:one).id
    end

    assert_redirected_to platforms_path
  end
end
