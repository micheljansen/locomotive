class Deployments < Application
  
  before :init_menu
  before :find_client
  before :find_service
  
  # GET /deployments
  # GET /deployments.xml
  def index
    @deployments = 
      if @client
        @client.deployments
      elsif @service
        @service.deployments
      else
        Deployment.all
      end
    display @deployments
  end

  # GET /deployments/1
  # GET /deployments/1.xml
  def show
    @deployment = Deployment.get(params[:id])
    @client = @deployment.client
    display @deployment
  end

  # GET /deployments/new
  # GET /deployments/new.xml
  def new
    @deployment = Deployment.new
    display @deployment
  end

  # GET /deployments/1/edit
  def edit
    @deployment = Deployment.get(params[:id])
    display @deployment
  end

  # POST /deployments
  # POST /deployments.xml
  #
  # CREATING a deployment, means deploying a new instance of
  # a given service to a given platform. 
  def create
    @deployment = Deployment.new(params[:deployment])

    if @deployment.save
      # flash[:notice] = 'Deployment was successfully created.'
      redirect resource(@deployment)
    else
      render :new
    end
  end

  # PUT /deployments/1
  # PUT /deployments/1.xml
  #
  # UPDATING a deployment might mean different things
  # depending on which parameters have changed:
  #   * If the version has changed, an upgrade or dowgrade should be performed
  #     so the given version of the service ends up being deployed to the platform.
  #   * If the platform has changed, this instance will be moved to a different
  #     set of servers.
  # These actions should be combined if possible.
  def update
    @deployment = Deployment.get(params[:id])
    
    old_release = @deployment.release
    old_platform = @deployment.platform
    
    #Deployment.transaction do
      # update the service instances data to reflect the changes
      begin
        @deployment.update_attributes(params[:deployment])
        
        # somehow, the relation attributes don't get updated automatically
        # after their corresponding _id attributes have been updated, so
        # reload manually to flush the cache
        @deployment.reload
        
        if old_platform != @deployment.platform
          # move from one platform to another
        end
      
        if old_release != @deployment.release
          # up / downgrade
          puts "upgrading from #{old_release.name} to #{@deployment.release.name}"
          @deployment.deploy
        end
      
      rescue Exception 
        STDERR.puts "ERROR: #{$!}"
      end
    #end

    #if 
      # flash[:notice] = 'Deployment was successfully updated.'
    #else
    #end
    redirect resource(@deployment)
  end

  def delete(id)
    @server_instance = ServerInstance.get(id)
    display @server_instance
  end

  # DELETE /deployments/1
  # DELETE /deployments/1.xml
  def destroy
    @deployment = Deployment.get(params[:id])
    raise NotFound unless @deployment
    if @deployment.destroy
      redirect resource(:deployments)
    else
      raise InternalServerError
    end
  end
  
  private
  
  def init_menu
    @menu = ["Manage", "Deploy"]
  end
  
  def find_client
    if params[:client_id]
      @client = Client.get(params[:client_id])
    end
  end
  
  def find_service
    if params[:service_id]
      @service = Service.get(params[:service_id])
    end
  end
  
end
