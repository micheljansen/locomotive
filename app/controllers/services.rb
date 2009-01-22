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
  end

  # POST /services
  # POST /services.xml
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        flash[:notice] = 'Service was successfully created.'
        format.html { redirect_to(service_url(@service.id)) }
        format.xml  { render :xml => @service, :status => :created, :location => @service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.xml
  def update
    @service = Service.get(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        flash[:notice] = 'Service was successfully updated.'
        format.html { redirect_to(service_url(@service.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.xml
  def destroy
    @service = Service.get(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "services") }
      format.xml  { head :ok }
    end
  end
  
  def init_menu
    @menu = ["Administration","Services"]
  end
end
