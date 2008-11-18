module Locomotive
  module Plugins
    
    DEFAULT_PATH = File.join(RAILS_ROOT, 'vendor','plugins','locomotive')
    
    class << self
      attr_accessor :discovered
      
      # Accessor to query plugins by their name
      # Returns the plugin with plugin_name if it is known
      def [](plugin_name)
        discovered[plugin_name]
      end
    end
    
    self.discovered = {}
    
    # Find and include all Locomotive plugins
    def self.discover

      discovered.clear
      
      puts "finding plugins"
            
      installed_plugins.each do |p|
        puts "\t#{p}"
        
        path = File.join(DEFAULT_PATH, p, 'lib', 'locomotive', 'plugins', p)
        
        $LOAD_PATH << path
        ActiveSupport::Dependencies.load_paths      << path
        ActiveSupport::Dependencies.load_once_paths << path
        require_dependency path
        
        discovered[p] = Locomotive::Plugins.const_get(p.camelize)
      end
      
    end
    
    def self.find_all
      discovered.values
    end
    
    # Generates a list of installed plugins from the directory structure
    # in vendor/plugins/locomotive.
    def self.installed_plugins
      base_path = Locomotive::Plugins::DEFAULT_PATH
      plugin_paths = Dir[File.join(base_path, '*')].select {|d| File.directory?(d)}
      plugin_names = plugin_paths.map {|d| File.basename(d)}
    end
  end
end