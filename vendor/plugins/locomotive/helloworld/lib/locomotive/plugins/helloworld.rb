# Helloworld
module Locomotive::Plugins
  
  module Helloworld
    include Locomotive::Plugin
    
    puts "Helloworld plugin loaded :)"
  
    short_name  "helloworld"
    long_name   "Hello World"
    version     1337
    description "Who could ever do without a HelloWorld plugin."
  
    #menu_path "Stuff" "HelloWorld"
    
    menu_path "Hello World", {:controller => "plugins"}
    
    # property :identifier "optional description" "optional regexp" "optional default"
    property :friend_name, "The name of the person we should greet", /.*/, "Michel"
    property :hello_in_native_language, "The word 'hello' in your native language", //, "hallo"
    property :useless_property, "This property is useless"

    #listens_for :subversion
    
  end
end  