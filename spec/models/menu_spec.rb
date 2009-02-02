require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Menu do

  before(:each) do
    Menu.reset
  end

  it "should be able to have links added to its root" do
    Menu["Spec menu"] = [{:controller => "spec_menu"}]
    Menu["Spec menu"].should == [{:controller => "spec_menu"}]
    Menu.root.add("Spec menu 2", {:controller => "spec_menu_2"})
    Menu.root["Spec menu 2"].should == [{:controller => "spec_menu_2"}]
  end

  it "should be able to have submenu's added" do
    Menu["Spec menu"]["Spec submenu"] = {:controller => "spec submenu"}
    Menu["Spec menu"]["Spec submenu 2"] = {:controller => "spec submenu 2"}
    Menu["Spec menu"].add("Spec submenu 3", {:controller => "spec submenu 3"})
    Menu["Spec menu"].should have(3).items

    Menu.root.add("Spec menu 2")
    Menu.root["Spec menu 2"].add("submenu 1")
    Menu["Spec menu 2"]["submenu 1"].add("blah")
    Menu["Spec menu 2"].should have(1).items

    Menu.root.should have(2).items
  end

  it "should be able to provide a default link" do
    Menu.root["Spec menu"] = "link"
    Menu.root.default_link.should == ["Spec menu", "link"]

    Menu.root["Dashboard"] = "new link"
    Menu.root.default_link.should == ["Dashboard", "new link"]
  end

  it "should give menu items back in correct order" do
    Menu["m Menu 1"] = "1"
    Menu["a Menu 2"] = "2"
    Menu["z Menu 3"] = "3"
    Menu["Dashboard"] = "0"

    Menu.root.links.should == [["Dashboard", "0"], ["m Menu 1", "1"], ["a Menu 2", "2"], ["z Menu 3", "3"]]
  end

  it "should be able to provide links for a submenu" do
    Menu["m1"] = Menu.new
    Menu["m1"].add("Dashboard", {:controller => "plugins", :action => "index"})
    Menu["m1"]["Properties"] = {:controller => "plugin_properties"}
  end

end
