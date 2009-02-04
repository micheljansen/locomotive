module Merb
  module Locomotive
    module AdministrationDashboardHelper

      # returns a humanized count string for a DataObjects model object
      # like "2 beers", "1 user" or "no life"
      def count_objects(type)
        count = type.count
        counter = (count == 0 ? "no" : count.to_s)
        type_name = Extlib::Inflection.demodulize(type.name)
        return (counter + " " + (count < 1 || count > 1 ? type_name.pluralize : type_name))
      end

    end
  end
end
