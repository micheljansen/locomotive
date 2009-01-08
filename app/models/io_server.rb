class IOServer < ServiceType
  name "iO Server"
  
  depends_on "appserver"
  

  def self.deploy(service_instance)
    #http://10.17.16.35/iomonitor/remotecontrollers/update_controller.asp?pass=test&action=update&customer_code=AA0001&server_name=NVC0945&servicestart=&activation=Caress,ImportWatchAndGo,Planning&port=9000&rmi=123&jmxrmi=123&jndi=123&memory=0
    puts "iO Deploy called for 
            release #{service_instance.release.name} 
            for client #{service_instance.client.name}"
  end

end