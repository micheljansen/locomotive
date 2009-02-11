Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  # RESTful routes
  namespace :locomotive, :path => '', :name_prefix => nil do

    resources :service_types, 'Locomotive::ServiceType'

    resources :dependencies, 'Locomotive::Dependency'

    resources :roles, 'Locomotive::Role'

    resources :systems, 'Locomotive::System' do
      resources :purposes, 'Locomotive::Purpose'
      resources :platform_memberships, 'Locomotive::PlatformMembership'
    end

    resources :platforms, 'Locomotive::Platform' do
      resources :platform_memberships, 'Locomotive::PlatformMembership'
    end

    #map.resources :contracts

    resources :deployments, 'Locomotive::Deployment'

    resources :services, 'Locomotive::Service' do
      resources :releases, 'Locomotive::Release'
      resources :deployments, 'Locomotive::Deployment'
    end

    resources :clients, 'Locomotive::Client' do
       resources :contracts, 'Locomotive::Contract'
       resources :deployments, 'Locomotive::Deployment'
    end

    resources :plugin_instances, 'Locomotive::PluginInstance'

    resources :plugin_properties, 'Locomotive::PluginProperty'

    resources :plugins, 'Locomotive::Plugin'
  end

  # slice(:locomotive, :name_prefix => nil, :path_prefix => '')

  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")

  # This is the default route for /:controller/:action/:id
  # This is fine for most cases.  If you're heavily using resource-based
  # routes, you may want to comment/remove this line to prevent
  # clients from calling your create or destroy actions with a GET
  # default_routes

  # Change this for your home page to be available at /
  match('/').to(:controller => 'locomotive/administration_dashboard', :action =>'index')

end

