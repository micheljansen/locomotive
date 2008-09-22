module Locomotive::Subsystems
  class Base
    
    def self.extended(base)
      puts "#{self} extended by #{base}"
    end
    
    def self.included(base)
      puts "#{self} included by #{base}"
    end
    
    
    def check()
      puts "nothing to check"
    end
    
  end
end