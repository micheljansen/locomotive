module Merb
  module AdministrationDashboardHelper

    # returns a humanized count string for an ActiveRecord model object
    # like "2 beers", "1 user" or "no life"
    def count_objects(type)
      counter = (type.count == 0 ? "no" : type.count.to_s)
      return (counter + " " + type.name) # FIXME: reinstate inflections .inflected
    end

  end
end
