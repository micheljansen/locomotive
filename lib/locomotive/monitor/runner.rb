require 'rubygems'
require 'daemons'
require File.join(File.dirname(__FILE__), 'daemon')

#Daemons.run(File.join(File.dirname(__FILE__), 'monitor_daemon.rb'))
Locomotive::Monitor::Daemon.new.send(ARGV[0])