# Helloworld
module Locomotive::Plugins

  module HelloWorld
    include Locomotive::Plugin
  
    short_name "hello_world"
    long_name "Simple HelloWorld plugin"
    description "Who could ever do without a HelloWorld plugin."
  
    #menu_path "Stuff" "HelloWorld"
    
    # property :identifier "optional description" "optional regexp" "optional default"
    property :friend_name, "The name of the person we should greet", /.*/, "Friend"
    property :useless_property, "This property is useless"
    
    
    #listens_for :subversion
    
  end
end  