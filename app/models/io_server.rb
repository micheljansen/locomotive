class IOServer < ServiceType
  name "iO Server"
  
  depends_on "appserver"
  

  def self.deploy(service_instance)
    puts "iO Deploy called for 
            release #{service_instance.release.name} 
            for client #{service_instance.client.name}"
  end

end