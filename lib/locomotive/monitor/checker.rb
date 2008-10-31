module Locomotive
  module Monitor
    class Checker
      
      def initialize(target, monitor, interval=60)
        @monitor = monitor
        @target = target
        @interval = interval
      end
      
      def run
        loop do
          
          Thread.new do
            log("checking #{@target.name}")
            result = @target.check()
            log("result for #{@target.name}, #{result}")
          end
          
          sleep(@interval)
        end
      end
      
      def start
        Thread.new do
          run
        end
      end
      
      def log(msg)
        #@monitor.log(msg) unless monitor.nil?
        puts msg
      end
    end
  end
end