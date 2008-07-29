module Locomotive
  module Plugin
    
    attr_accessor :short_name, :long_name
    
        
    def self.included(base)
      base.extend Plugin
      RAILS_DEFAULT_LOGGER.debug("Registering Locomotive Plugin #{base}")
      descendants << base
      RAILS_DEFAULT_LOGGER.debug("Currently known plugins: #{@descendants}")
      
    end
    
    def self.descendants
      @descendants ||= []
    end
    
    def self.find_all
      return @descendants
    end
    
    def short_name (name="UnnamedPlugin")
      @short_name = name
    end
    

    
  end
end