module Merb
  module Locomotive
    module DeploymentsHelper

      # convenience method to check what we are listing for
      def for?(type)
        showing_what == type
      end

      def showing_what
        return :client if @client
        return :service if @service
        #otherwise
        return :all
      end

      def title
        case showing_what
          when :service
            "Deployed instances of #{@service.name}"
          when :client
            "Deployed instances for #{@client.name}"
          else
            "Deployed instances"
        end
      end

    end
  end
end
