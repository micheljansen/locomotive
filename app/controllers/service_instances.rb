class ServiceInstances < Application
  
  before :init_menu
  before :find_client
  before :find_service
  
  # GET /service_instances
  # GET /service_instances.xml
  def index
    @service_instances = 
      if @client
        @client.service_instances
      elsif @service
        @service.service_instances
      else
        ServiceInstance.all
      end
    display @service_instances
  end

  # GET /service_instances/1
  # GET /service_instances/1.xml
  def show
    @service_instance = ServiceInstance.get(params[:id])
    @client = @service_instance.client
    display @service_instance
  end

  # GET /service_instances/new
  # GET /service_instances/new.xml
  def new
    @service_instance = ServiceInstance.new
    display @service_instance
  end

  # GET /service_instances/1/edit
  def edit
    @service_instance = ServiceInstance.get(params[:id])
    display @service_instance
  end

  # POST /service_instances
  # POST /service_instances.xml
  #
  # CREATING a service_instance, means deploying a new instance of
  # a given service to a given platform. 
  def create
    @service_instance = ServiceInstance.new(params[:service_instance])

    if @service_instance.save
      # flash[:notice] = 'ServiceInstance was successfully created.'
      redirect resource(@service_instance)
    else
      render :new
    end
  end

  # PUT /service_instances/1
  # PUT /service_instances/1.xml
  #
  # UPDATING a service_instance might mean different things
  # depending on which parameters have changed:
  #   * If the version has changed, an upgrade or dowgrade should be performed
  #     so the given version of the service ends up being deployed to the platform.
  #   * If the platform has changed, this instance will be moved to a different
  #     set of servers.
  # These actions should be combined if possible.
  def update
    @service_instance = ServiceInstance.get(params[:id])
    
    old_release = @service_instance.release
    old_platform = @service_instance.platform
    
    #ServiceInstance.transaction do
      # update the service instances data to reflect the changes
      begin
        @service_instance.update_attributes(params[:service_instance])
        
        # somehow, the relation attributes don't get updated automatically
        # after their corresponding _id attributes have been updated, so
        # reload manually to flush the cache
        @service_instance.reload
        
        if old_platform != @service_instance.platform
          # move from one platform to another
        end
      
        if old_release != @service_instance.release
          # up / downgrade
          puts "upgrading from #{old_release.name} to #{@service_instance.release.name}"
          @service_instance.deploy
        end
      
      rescue Exception 
        STDERR.puts "ERROR: #{$!}"
      end
    #end

    #if 
      # flash[:notice] = 'ServiceInstance was successfully updated.'
    #else
    #end
    redirect resource(@service_instance)
  end

  # DELETE /service_instances/1
  # DELETE /service_instances/1.xml
  def destroy
    @service_instance = ServiceInstance.get(params[:id])
    raise NotFound unless @service_instance
    if @service_instance.destroy
      redirect resource(:service_instances)
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
