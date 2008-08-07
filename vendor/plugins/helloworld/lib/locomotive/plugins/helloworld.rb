# Helloworld
module Locomotive::Plugins

  module HelloWorld
    include Locomotive::Plugin
  
    short_name  "hello_world"
    long_name   "Simple HelloWorld plugin"
    version     1337
    description "Who could ever do without a HelloWorld plugin."
  
    #menu_path "Stuff" "HelloWorld"
    
    # property :identifier "optional description" "optional regexp" "optional default"
    property :friend_name, "The name of the person we should greet", /.*/, "Michel"
    property :hello_in_native_language, "The word 'hello' in your native language", //, "hallo"
    property :useless_property, "This property is useless"

    #listens_for :subversion
    
  end
end  