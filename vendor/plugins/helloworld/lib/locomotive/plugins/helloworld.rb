# Helloworld
module Locomotive::Plugins

  class HelloWorld
    include Locomotive::Plugin
  
    short_name "hello_world"
    long_name "Simple HelloWorld plugin"
    description "Who could ever do without a HelloWorld plugin."
  
    #menu_path "Stuff" "HelloWorld"
  end    

end  