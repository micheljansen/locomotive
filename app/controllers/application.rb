module Locomotive
  class Application < Merb::Controller

#    controller_for_slice
    self._template_roots << [File.join(File.dirname(__FILE__), "..", "views"), :_template_location]

  end
end
