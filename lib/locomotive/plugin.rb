module Locomotive
  module Plugin

    #attr_accessor :short_name, :long_name 


    def self.included(base)
      base.extend ClassMethods

      #base.include InstanceMethods
      #base.send(:include, InstanceMethods)
    end

    # get all plugins
#    def self.find_all
#      self.known_plugins.values
#    end

    # get all plugin ids (short_name)
#    def self.all_ids
#      self.known_plugins.keys
#    end

    # retrieve a plugin by its short_name (id)
#    def self.find_by_id(name)
#      self.known_plugins[name]
#    end

    private

    # hash that keeps all plugins indexed by their name
    def self.known_plugins
      @locomotive_all_known_plugins ||= {}
    end

    def self.logger
      Merb.logger
    end



    module ClassMethods

      def logger
        Merb.logger
      end

      def plugin_path(new_path=nil)
        @plugin_path ||= File.join(Locomotive::Plugins::DEFAULT_PATH, short_name)
      end

      def version(new_version=nil)
        @version = new_version if new_version
        @version || 0
      end

      # should be the name of the module's directory
      def short_name(new_name=nil)
        @short_name = new_name if new_name
        @short_name || self.to_s.demodulize.underscore
      end

      def long_name(new_name=nil)
        @long_name = new_name if new_name
        @long_name || short_name
      end

      def name
        long_name
      end

      def description(new_desc=nil)
        @locomotive_plugin_description = new_desc if new_desc
        @locomotive_plugin_description || ""
      end

      #extend this to perform custom installation
      def install
        puts "Installing Locomotive plugin #{short_name}"
      end

      #extend this to perform custom uninstall operations
      def uninstall
        puts "Uninstalling Locomotive plugin #{short_name}"
      end

      def properties
        @properties ||= Hash.new # FIXME: AS-ism ||= HashWithIndifferentAccess.new
      end

      def menu_path(key, *args)
        Menu.add(key, *args)
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
