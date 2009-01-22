Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  # RESTful routes
  resources :service_types

  resources :dependencies

  resources :roles

  resources :servers do
    resources :purposes
    resources :platform_memberships
  end

  resources :platforms do
    resources :platform_memberships
  end

  #map.resources :contracts

  resources :service_instances

  resources :services do
    resources :releases
    resources :service_instances
  end

  resources :clients do
    resources :contracts
    resources :service_instances
  end

  resources :plugin_instances

  resources :plugin_properties

  resources :plugins
  
  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")

  # This is the default route for /:controller/:action/:id
  # This is fine for most cases.  If you're heavily using resource-based
  # routes, you may want to comment/remove this line to prevent
  # clients from calling your create or destroy actions with a GET
  # default_routes
  
  # Change this for your home page to be available at /
  match('/').to(:controller => 'AdministrationDashboard', :action =>'index')

end

