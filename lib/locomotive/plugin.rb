module Locomotive
  module Plugin
    
    #attr_accessor :short_name, :long_name 
    
        
    def self.included(base)
      
      base.extend ClassMethods 
      #base.include InstanceMethods
      #base.send(:include, InstanceMethods)

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
      
      def short_name(new_name=nil)
        @short_name = new_name if new_name
        @short_name || self.to_s.underscore
      end
      
      def long_name(new_name=nil)
        @long_name = new_name if new_name
        @long_name || short_name
      end
      
      def description(new_desc=nil)
        @locomotive_plugin_description = new_desc if new_desc
        @locomotive_plugin_description || ""
      end
      
    end
    
    module InstanceMethods
      
    
    end
    
  end
end