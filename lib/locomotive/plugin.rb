module Locomotive
  module Plugin
    
    #attr_accessor :short_name, :long_name 
    
        
    def self.included(base)
      
      base.extend ClassMethods 
      #base.include InstanceMethods
      base.send(:include, InstanceMethods)

      RAILS_DEFAULT_LOGGER.debug("Registering Locomotive Plugin #{base}")
      descendants << base
      RAILS_DEFAULT_LOGGER.debug("Currently known plugins: ")
      descendants.each do |d|
        RAILS_DEFAULT_LOGGER.debug("\t #{d}")
      end
      
    end
    
    
    def self.descendants
      @locomotive_plugin_descendants ||= Set.new
    end
    
    
    module ClassMethods
      def say_hi
        "hi"
      end
    end
    
    module InstanceMethods
      
      def short_name(name)
         raise "no short name set!" unless @short_name
         @short_
      end
    
    end
    
  end
end