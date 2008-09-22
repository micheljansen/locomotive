class Locomotive::Subsystems::CustomHttpd < Subsystem
  puts "registering custom subsystem"
  Subsystem.register(self)
end