module Locomotive
  module Plugin
    
    #attr_accessor :short_name, :long_name 
    
        
    def self.included(base)
      
      base.extend ClassMethods
      #base.include InstanceMethods
      #base.send(:include, InstanceMethods)

      RAILS_DEFAULT_LOGGER.debug("Registering Locomotive Plugin #{base}")
      descendants[base.short_name] = base
      RAILS_DEFAULT_LOGGER.debug("Currently known plugins: ")
      descendants.each_value do |d|
        RAILS_DEFAULT_LOGGER.debug("\t #{d}")
      end
      
    end
    
    
    def self.descendants
      @locomotive_plugin_descendants ||= {}
    end
    
    def self.find_all
      self.descendants.values
    end
    
    # get all plugin ids (short_name)
    def self.all_ids
      self.descendants.keys
    end
    
    # retrieve a plugin by its short_name (id)
    def self.find_by_id(name)
      self.descendants[name]
    end

    
    
    module ClassMethods 
      
      def logger
        RAILS_DEFAULT_LOGGER
      end
      
      def say_hi
        "hi"
      end
      
      def short_name(new_name=nil)
        @short_name = new_name if new_name
        @short_name || self.to_s.demodulize.underscore
      end
      
      def long_name(new_name=nil)
        @long_name = new_name if new_name
        @long_name || short_name
      end
      
      def description(new_desc=nil)
        @locomotive_plugin_description = new_desc if new_desc
        @locomotive_plugin_description || ""
      end
      
      def properties
        @properties ||= {}
      end
      
      
      # set a property
      #  property :identifier "optional description" "optional regexp" "optional default"
      def property(identifier, *args)
        
        logger.debug("defining property #{short_name}.#{identifier}")
        
        description = args.shift
        format = args.shift
        default = args.shift
        
        properties[identifier] = default
        
        add_property_accessor(identifier)
        
      end
      
      
      def method_missing(method,*args)
        logger.debug("Rerouting acces to property #{short_name}.#{method}")
        super(method, args);
      end


      private
      
      # add property accessor method
      #  property (sym)
      def add_property_accessor(property)
        instance_eval <<-EOT, __FILE__, __LINE__
          def #{property}
            properties[:#{property}]
          end
        
          def #{property}=(value)
            properties[:#{property}] = value
          end
        EOT
      end
      
      
    end
    
    module InstanceMethods
    end
    
  end
end