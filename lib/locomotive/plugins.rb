module Locomotive
  module Plugins
    
    class << self
      attr_accessor :discovered
    end
    
    self.discovered = {}
    
    # Find and include all Locomotive plugins
    def self.discover

      discovered.clear
      
      puts "finding plugins"
            
      installed_plugins.each do |p|
        puts "\t#{p}"
        
      end
    end
    
    # Generates a list of installed plugins from the directory structure
    # in vendor/plugins/locomotive.
    def self.installed_plugins
      base_path = File.join(RAILS_ROOT, 'vendor','plugins','locomotive')
      plugin_paths = Dir[File.join(base_path, '*')].select {|d| File.directory?(d)}
      plugin_names = plugin_paths.map {|d| File.basename(d)}
    end
  end
end