class Services < Application
  
  before :init_menu
  
  # GET /services
  # GET /services.xml
  def index
    @services = Service.all
    display @services
  end

  # GET /services/1
  # GET /services/1.xml
  def show
    @service = Service.get(params[:id])
    @releases = @service.releases
    @service_instances = @service.service_instances.find(:all, :order => "client_id DESC")
    display @service
  end

  # GET /services/new
  # GET /services/new.xml
  def new
    @service = Service.new
    display @service
  end

  # GET /services/1/edit
  def edit
    @service = Service.get(params[:id])
    display @service
  end

  # POST /services
  # POST /services.xml
  def create
    @service = Service.new(params[:service])

    if @service.save
      # flash[:notice] = 'Service was successfully created.'
      redirect resource(@service)
    else
      render :new
    end
  end

  # PUT /services/1
  # PUT /services/1.xml
  def update
    @service = Service.get(params[:id])

    if @service.update_attributes(params[:service])
      # flash[:notice] = 'Service was successfully updated.'
      redirect resource(@service)
    else
      render :edit
    end
  end

  # DELETE /services/1
  # DELETE /services/1.xml
  def destroy
    @service = Service.get(params[:id])
    raise NotFound unless @service
    if @service.destroy
      redirect resource(:services)
    else
      raise InternalServerError
    end
  end
  
  def init_menu
    @menu = ["Administration","Services"]
  end
end
