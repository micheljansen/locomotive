module Merb
  module GlobalHelpers
    # helpers defined here available to all views.

    def menu_link(name, url)
      if url.kind_of?(Symbol)
        link_to(name, resource(url))
      else
        link_to(name, url)
      end
    end

  end
end
