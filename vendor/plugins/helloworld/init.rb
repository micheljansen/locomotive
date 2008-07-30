# Include hook code here
require 'locomotive/plugins/helloworld'

#for development mode
load_paths.each do |path|
  Dependencies.load_once_paths.delete(path)
end
