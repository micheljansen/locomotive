module ServiceInstancesHelper
  
  # convenience method to check what we are listing for
  def for?(type)
    showing_what == type
  end
  
  def showing_what
    :client if @client
    :service if @service
    :all if @all
  end
  
  def title
    case showing_what
      when :service
        "Listing deployed instances of #{@service.name}"
      when :client
        "Listing deployed instances for #{@client.name}"
      else
        "Listing all deployed instances"
    end
  end
end
