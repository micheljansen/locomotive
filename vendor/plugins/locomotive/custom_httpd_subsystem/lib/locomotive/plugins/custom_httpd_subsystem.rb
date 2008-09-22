module Locomotive::Plugins
  
  module CustomHttpdSubsystem
    include Locomotive::Plugin
  
    #short_name  "helloworld"
    long_name   "Custom httpd subsystem"
    version     100
    description "Plugin to add custom httpd subsystem type"
  
    #menu_path "Stuff" "HelloWorld"
    
    menu_path "Hello World", {:controller => "plugins"}
    
    # property :identifier "optional description" "optional regexp" "optional default"
    property :check_path, "The path to use for checking if the server is up", /.*/, "/"
    
    
    def self.initialize
      entries = Dir[File.join(plugin_path, 'lib', 'locomotive', 'subsystems' ,'*')]
      files = entries.select {|f| File.file?(f)}
      
      files.each do |path|
        $LOAD_PATH << path
        Dependencies.load_paths      << path
        Dependencies.load_once_paths << path
      end
      
    end
    
  end
end