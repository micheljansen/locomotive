module Locomotive::Plugins::SpecTestPlugin
  include Locomotive::Plugin

  short_name  "spec_test_plugin"
  long_name   "Plugin for use in RSpec"
  version     123
  description "This one is only used during testing"

  #menu_path "Stuff" "HelloWorld"

  # property :identifier "optional description" "optional regexp" "optional default"
  property :unchecked_without_anything
  property :unchecked_without_defaults, "This one is slightly less anarchistic"
  property :unchecked_with_defaults, "We want defaults, but no rules", nil, "default_value"
  property :checked_with_defaults, "This one has a default value and a format", /[a-z]*/, "valid"
  property :invalid_checked_with_defaults, "Invalid by default", /[a-z]*/, "invalid1"

  #listens_for :subversion
end
