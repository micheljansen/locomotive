require 'rubygems'
require 'daemons'

# load the entire rails framework
# TODO: check if we can do this more elegantly :)
# require File.join(File.dirname(__FILE__), "..", "..", "..", "config", "environment.rb")

module Locomotive
  module Monitor
    
    class Daemon
      
      # construct a new daemon and initialize its files
      def initialize
        @logfilename = File.expand_path(__FILE__) + '.log'
        @logfile = File.open(@logfilename, File::CREAT|File::APPEND|File::RDWR)
        @threads = [] # keeps all threads
        @target_thread = {} # maps targets to the threads that monitor them
        @threads_mutex = Mutex.new
      end
    
      # Run the execution loop. 
      # This call normally won't return until everything is finished.
      def run
        
        #loop forever
        loop do
          
          Server.all.each do |server|
            result = server.check()
            log("result for #{server.name}: #{result}")
          end
            
        end
    
      end
      
      # simple log wrapper
      def log(msg)
        msg = Time.new.to_s + ": " + msg
        puts msg
        @logfile.puts(msg)
      end
    end
  end
  
  class MockTarget
    def method_missing(name, *args, &block) 
      puts "Called #{name} with #{args.inspect} and #{block}" 
      return "nothing"
    end 
  end
  
end
