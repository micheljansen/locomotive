require 'rubygems'
require 'rake/gempackagetask'

require 'merb-core'
require 'merb-core/tasks/merb'

GEM_NAME = "locomotive"
AUTHORS = ["Alex Coles", "Michel Jansen"]
EMAILS = ["alex@alexcolesportfolio.com", "mail@micheljansen.org"]
HOMEPAGE = "http://locomotiveapp.com"
SUMMARY = "Slice version of Locomotive, the open-source server/service/application monitor and deployment panel"
GEM_VERSION = "0.0.1"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'merb'
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHORS
  s.email = EMAILS
  s.homepage = HOMEPAGE
  s.add_dependency('merb-slices', '>= 1.0.8.1')
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,spec,app,public,stubs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install the gem"
task :install do
  Merb::RakeHelper.install(GEM_NAME, :version => GEM_VERSION)
end

desc "Uninstall the gem"
task :uninstall do
  Merb::RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

require 'spec/rake/spectask'
require 'merb-core/test/tasks/spectasks'
desc 'Default: run spec examples'
task :default => 'spec'
