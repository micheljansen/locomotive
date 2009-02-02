class ServiceType

  # array of known service types
  def self.known_service_types
    self.subclasses
  end

  # find all (direct or indirect) subclasses
  def self.subclasses(direct = false)
    classes = []

    ObjectSpace.each_object(Class) do |klass|
      if(direct)
        classes << klass if klass.superclass == self
      else
        classes << klass if klass.ancestors.include? self
      end
    end

    return classes
  end

  class << self
    # get/set the name
    def name(new_name=nil)
      @name = new_name if new_name
      @name
    end

    def depends_on(role)
      if(role.class == Role)
        # it's an active record Role model
        dependencies << role
      else
        # it's a string, so find it or create it
        # FIXME: find DM/Merb equivalent
		# dependencies << (Role.find_by_name(role) ? Role.find_by_name(role) : Role.create(:name => role))
      end
    end

    # A list of ActiveRecord Role models
    def dependencies
      @dependencies ||= []
    end

    def dependency_names
      dependencies.map {|r| r.name }
    end

  end

  def name
    self.class.name
  end

  def dependencies
    self.class.dependencies
  end

  def dependency_names
    self.class.dependency_names
  end

  def depends_on?(role)
    if(role.class == Role)
      dependencies.include? role
    else
      dependency_names.include? role
    end
  end

  # deploy a deployment of this type
  def self.deploy(deployment)
    puts "deploying an instance of service #{deployment.release.service.name}
            release #{deployment.release.name}
            of type #{self.name}
            for client #{deployment.client.name}"
  end

end
