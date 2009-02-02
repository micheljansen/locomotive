class IOServer < ServiceType
  name "iO Server"

  depends_on "appserver"


  def self.deploy(deployment)
    puts "iO Deploy called for
            release #{deployment.release.name}
            for client #{deployment.client.name}"
  end

end
