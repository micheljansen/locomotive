require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Dependencies do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dependencies)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_dependency" do
    assert_difference('Dependency.count') do
      post :create, :dependency => { }
    end

    assert_redirected_to dependency_path(assigns(:dependency))
  end

  it "should_show_dependency" do
    get :show, :id => dependencies(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => dependencies(:one).id
    assert_response :success
  end

  it "should_update_dependency" do
    put :update, :id => dependencies(:one).id, :dependency => { }
    assert_redirected_to dependency_path(assigns(:dependency))
  end

  it "should_destroy_dependency" do
    assert_difference('Dependency.count', -1) do
      delete :destroy, :id => dependencies(:one).id
    end

    assert_redirected_to dependencies_path
  end
end
