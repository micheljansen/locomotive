Dir[File.join(RAILS_ROOT, 'lib', 'locomotive', 'subsystems', '*')].each do |path|
  require path
end
