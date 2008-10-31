require 'rubygems'
require 'daemons'
require File.join(File.dirname(__FILE__), 'monitor_daemon')

#Daemons.run(File.join(File.dirname(__FILE__), 'monitor_daemon.rb'))
Locomotive::MonitorDaemon.new.send(ARGV[0])
