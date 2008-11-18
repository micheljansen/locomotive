module Locomotive
  module Monitor
    class Checker
      
      def initialize(target, monitor, interval=60)
        @monitor = monitor
        @target = target
        @interval = interval
      end
      
      def run
        log("checking #{@target.name}")
        result = @target.check()
        log("result for #{@target.name}, #{result}")
        @monitor.mark_completed(@target)
        log("all done, Thread for #{target.name} signing off!")
      end
      
      def start
        Thread.new do
          run
        end
      end
      
      def log(msg)
        #puts msg
        @monitor.log(msg) unless @monitor.nil?
      end
    end
  end
end