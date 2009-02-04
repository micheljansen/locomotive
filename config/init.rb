# Go to http://wiki.merbivore.com/pages/init-rb

require 'config/dependencies.rb'

# Merb.push_path(:lib, Merb.root / 'lib', '**/*.rb')
#
# We can't use Merb.push_path as Ruby does not appear to support excluding
# patterns in its globs, i.e. Dir.glob("lib/**/*{!tasks}.rb") doesn't do
# anything. There are a number of lib/locomotive/**tasks.rb files, necessary
# for being a slice, but not to be autoloaded.
#
# Instead we add lib/ to the load path, and require as necesssary.
$LOAD_PATH.unshift(Merb.root / "lib")

use_orm :datamapper
use_test :rspec
use_template_engine :erb

Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper

  # cookie session store configuration
  c[:session_secret_key]  = '5c27cacee159a9139caaa9f095ad8a736a5d7264'  # required for cookie session store
  c[:session_id_key] = '_locomotive_session_id' # cookie session id key, defaults to "_session_id"
end

Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.

  # Require application files contained in the lib/ directory
  # (N.B. these are not autoloaded, see note above)
  require 'locomotive' / 'plugin'
  require 'locomotive' / 'plugins'
end

Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end
