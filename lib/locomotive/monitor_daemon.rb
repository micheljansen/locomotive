require 'rubygems'
require 'daemons'

# load the entire rails framework
# TODO: check if we can do this more elegantly :)
require File.join(File.dirname(__FILE__), "..", "..", "config", "environment.rb")

module Locomotive
  class MonitorDaemon
    include Daemonize

    # construct a new daemon and initialize its files
    def initialize
      @logfilename = File.expand_path(__FILE__) + '.log'
      @logfile = File.open(@logfilename, File::CREAT|File::APPEND|File::RDWR)
      @threads = []
    end
    
    # run the execution loop. this call normally won't return
    def run
      #loop do
        log("loop")
        
        Server.find(:all).each do |server|
          log("Starting check for server " +server.name)
          @threads << Locomotive::Monitor::Checker.new(server, self, 10).start();
          
          # walk each of the services in the server
        end

        @threads.each {|t| t.join()}
        
      #end
    end
    
    def start
      daemonize()
      run
    end
    
    def log(msg)
      msg = Time.new.to_s + ": " + msg
      puts msg
      @logfile.puts(msg)
    end
    
  end
end