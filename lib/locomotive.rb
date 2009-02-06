if defined?(Merb::Plugins)

  $:.unshift File.dirname(__FILE__)

  dependency 'merb-slices', :immediate => true
  Merb::Plugins.add_rakefiles "locomotive/merbtasks", "locomotive/slicetasks", "locomotive/spectasks"

  # Register the Slice for the current host application
  Merb::Slices::register(__FILE__)

  # Slice configuration - set this in a before_app_loads callback.
  # By default a Slice uses its own layout, so you can swicht to
  # the main application layout or no layout at all if needed.
  #
  # Configuration options:
  # :layout - the layout to use; defaults to :locomotive
  # :mirror - which path component types to use on copy operations; defaults to all
  Merb::Slices::config[:locomotive][:layout] ||= :locomotive

  # All Slice code is expected to be namespaced inside a module
  module Locomotive

    # Slice metadata
    self.description = "Slice version of Locomotive, the open-source server/service/application monitor and deployment panel"
    self.version = "0.0.1"
    self.author = "Alex Coles"

    # Stub classes loaded hook - runs before LoadClasses BootLoader
    # right after a slice's classes have been loaded internally.
    def self.loaded
    end

    # Initialization hook - runs before AfterAppLoads BootLoader
    def self.init
    end

    # Activation hook - runs after AfterAppLoads BootLoader
    def self.activate
    end

    # Deactivation hook - triggered by Merb::Slices.deactivate(Locomotive)
    def self.deactivate
    end

    # Setup routes inside the host application
    #
    # @param scope<Merb::Router::Behaviour>
    #  Routes will be added within this scope (namespace). In fact, any
    #  router behaviour is a valid namespace, so you can attach
    #  routes at any level of your router setup.
    #
    # @note prefix your named routes with :locomotive_
    #   to avoid potential conflicts with global named routes.
    def self.setup_router(scope)

      scope.resources :service_types, 'Locomotive::ServiceType'
      scope.resources :dependencies, 'Locomotive::Dependency'
      scope.resources :roles, 'Locomotive::Role'
      scope.resources :servers, 'Locomotive::Server' do |s|
        s.resources :purposes, 'Locomotive::Purpose'
        s.resources :platform_memberships, 'Locomotive::PlatformMembership'
      end
      scope.resources :platforms, 'Locomotive::Platform' do |p|
        p.resources :platform_memberships, 'Locomotive::PlatformMembership'
      end
      scope.resources :deployments, 'Locomotive::Deployment'
      scope.resources :services, 'Locomotive::Service' do |s|
        s.resources :releases, 'Locomotive::Release'
        s.resources :deployments, 'Locomotive::Deployment'
      end
      scope.resources :clients, 'Locomotive::Client' do |c|
        c.resources :contracts, 'Locomotive::Contract'
        c.resources :deployments, 'Locomotive::Deployment'
      end
      scope.resources :plugin_instances, 'Locomotive::PluginInstance'
      scope.resources :plugin_properties, 'Locomotive::PluginProperties'
      scope.resources :plugins, 'Locomotive::Plugin'

      # the slice is mounted at /locomotive - note that it comes before default_routes
      scope.match('/').to(:controller => 'administration_dashboard', :action =>'index')

      # enable slice-level default routes by default
      # scope.default_routes
    end

  end

  # Setup the slice layout for Locomotive
  #
  # Use Locomotive.push_path and Locomotive.push_app_path
  # to set paths to locomotive-level and app-level paths. Example:
  #
  # Locomotive.push_path(:application, Locomotive.root)
  # Locomotive.push_app_path(:application, Merb.root / 'slices' / 'locomotive')
  # ...
  #
  # Any component path that hasn't been set will default to Locomotive.root
  #
  # Or just call setup_default_structure! to setup a basic Merb MVC structure.
  Locomotive.setup_default_structure!

  # Add dependencies for other Locomotive classes below. Example:
  # dependency "locomotive/other"

end
