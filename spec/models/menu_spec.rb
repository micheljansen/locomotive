require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Locomotive::Menu do

  before(:each) do
    Locomotive::Menu.reset
  end

  it "should be able to have links added to its root" do
    Locomotive::Menu["Spec menu"] = [{:controller => "spec_menu"}]
    Locomotive::Menu["Spec menu"].should == [{:controller => "spec_menu"}]
    Locomotive::Menu.root.add("Spec menu 2", {:controller => "spec_menu_2"})
    Locomotive::Menu.root["Spec menu 2"].should == [{:controller => "spec_menu_2"}]
  end

  it "should be able to have submenu's added" do
    Locomotive::Menu["Spec menu"]["Spec submenu"] = {:controller => "spec submenu"}
    Locomotive::Menu["Spec menu"]["Spec submenu 2"] = {:controller => "spec submenu 2"}
    Locomotive::Menu["Spec menu"].add("Spec submenu 3", {:controller => "spec submenu 3"})
    Locomotive::Menu["Spec menu"].should have(3).items

    Locomotive::Menu.root.add("Spec menu 2")
    Locomotive::Menu.root["Spec menu 2"].add("submenu 1")
    Locomotive::Menu["Spec menu 2"]["submenu 1"].add("blah")
    Locomotive::Menu["Spec menu 2"].should have(1).items

    Locomotive::Menu.root.should have(2).items
  end

  it "should be able to provide a default link" do
    Locomotive::Menu.root["Spec menu"] = "link"
    Locomotive::Menu.root.default_link.should == ["Spec menu", "link"]

    Locomotive::Menu.root["Dashboard"] = "new link"
    Locomotive::Menu.root.default_link.should == ["Dashboard", "new link"]
  end

  it "should give menu items back in correct order" do
    Locomotive::Menu["m Menu 1"] = "1"
    Locomotive::Menu["a Menu 2"] = "2"
    Locomotive::Menu["z Menu 3"] = "3"
    Locomotive::Menu["Dashboard"] = "0"

    Locomotive::Menu.root.links.should == [["Dashboard", "0"], ["m Menu 1", "1"], ["a Menu 2", "2"], ["z Menu 3", "3"]]
  end

  it "should be able to provide links for a submenu" do
    Locomotive::Menu["m1"] = Locomotive::Menu.new
    Locomotive::Menu["m1"].add("Dashboard", {:controller => "plugins", :action => "index"})
    Locomotive::Menu["m1"]["Properties"] = {:controller => "plugin_properties"}
  end

end
