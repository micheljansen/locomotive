class ServiceType
  
  def self.known_service_types
    [MongrelRails]
  end
  
  def name
    raise "abstract service type does not have a name"
  end
  
  # A list of ActiveRecord Role models
  def self.dependencies
    @@dependencies ||= []
  end
  
  def self.depends_on(role)
    if(role.respond_to?(:id) && role.id)
      # it's an active record model
      dependencies << role
    else
      # it'is a string, so find it or create it
      dependencies << (Role.find_by_name(role) ? Role.find_by_name(role) : Role.create(role))    
    end
  end
end
