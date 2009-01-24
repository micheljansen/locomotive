require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Plugins do 
  it "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plugins)
  end

  it "should_show_plugin" do
    get :show, :id => "hello_world"
    assert_response :success
  end
end
