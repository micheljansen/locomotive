require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Purposes do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purposes)
  end

  it "should_get_new" do
    get :new
    assert_response :success
  end

  it "should_create_purpose" do
    assert_difference('Purpose.count') do
      post :create, :purpose => { }
    end

    assert_redirected_to purpose_path(assigns(:purpose))
  end

  it "should_show_purpose" do
    get :show, :id => purposes(:one).id
    assert_response :success
  end

  it "should_get_edit" do
    get :edit, :id => purposes(:one).id
    assert_response :success
  end

  it "should_update_purpose" do
    put :update, :id => purposes(:one).id, :purpose => { }
    assert_redirected_to purpose_path(assigns(:purpose))
  end

  it "should_destroy_purpose" do
    assert_difference('Purpose.count', -1) do
      delete :destroy, :id => purposes(:one).id
    end

    assert_redirected_to purposes_path
  end
end
