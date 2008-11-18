require 'rubygems'
require 'daemons'

# load the entire rails framework
# TODO: check if we can do this more elegantly :)
require File.join(File.dirname(__FILE__), "..", "..", "..", "config", "environment.rb")

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
          
          Server.find(:all).each do |server|
            
            if !check_running_for(server)
              mock_target = MockTarget.new
              start_check(mock_target)           
            else            
              log("Skipping " +server.name)         
            end

            # TODO: walk each of the services in the server
            
          end
          
          sleep 10
        end
        
        @threads.each {|t| t.join()}
    
      end
    
      # Start the monitor in the background
      #def start
      #  daemonize()
      #  run
      #end
      
      def start_check(target)
        log("Starting thread for " + target.name)
        
        thread = Checker.new(target, self).start()
        @threads_mutex.synchronize do
          @threads << thread
          @target_thread[target] = thread              
        end
      end
      
      # is there a check running for target?
      def check_running_for(target)
        !@target_thread[target].nil?
      end
      
      #mark a check for a target as completed
      def mark_completed(target)
        log("marking thread for #{target.name} as completed")
        @threads_mutex.synchronize do
          thread = @target_thread[target]
          @threads = @treads -- [thread]
          @target_thread[target] = nil
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