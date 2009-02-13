# dependencies are generated using a strict version, don't forget to edit the dependency versions when upgrading.
merb_gems_version = "1.0.9"
dm_gems_version   = "0.9.10"
do_gems_version   = "0.9.11"

# For more information about each component, please read http://wiki.merbivore.com/faqs/merb_components
dependency "merb-core", merb_gems_version
dependency "merb-action-args", merb_gems_version
dependency "merb-assets", merb_gems_version
# dependency("merb-cache", merb_gems_version) do
#  Merb::Cache.setup do
#    register(Merb::Cache::FileStore)
#  end
# end
dependency "merb-helpers", merb_gems_version
dependency "merb-mailer", merb_gems_version
dependency "merb-slices", merb_gems_version
dependency "merb-auth-core", merb_gems_version
dependency "merb-auth-more", merb_gems_version
dependency "merb-auth-slice-password", merb_gems_version
dependency "merb-param-protection", merb_gems_version
dependency "merb-exceptions", merb_gems_version
dependency "merb-haml", merb_gems_version

dependency "data_objects", do_gems_version
dependency "do_sqlite3", do_gems_version # If using another database, replace this
dependency "dm-core", dm_gems_version
dependency "dm-aggregates", dm_gems_version
dependency "dm-migrations", dm_gems_version
dependency "dm-timestamps", dm_gems_version
dependency "dm-types", dm_gems_version
dependency "dm-validations", dm_gems_version
dependency "dm-serializer", dm_gems_version
dependency "dm-is-paginated"

dependency "merb_datamapper", merb_gems_version

# Non-Runtime Dependencies
# ========================
#
# Dependencies that should not required at runtime, but should be bundled
# with the application nonetheless.
#
# spec and feature testing dependencies
# -------------------------------------
dependency 'cucumber', :require => nil
dependency 'webrat', :require => nil
#dependency 'merb-cucumber'

# Rake task dependencies
# ----------------------
dependency 'fastercsv', :require => nil
