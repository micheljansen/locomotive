module Locomotive
  class Plugin
    class << self
      def short_name (new_name = nil)
        @short_name = new_name if new_name
        @display_name || self.to_s
      end
      
      def available_plugins
        Plugin.subclasses
      end
    end
  end
end