class Releases < Application
  
  before :init_menu
  
  # GET /releases
  # GET /releases.xml
  def index
    @releases = Release.all
    display @releases
  end

  # GET /releases/1
  # GET /releases/1.xml
  def show
    @release = Release.get(params[:id])
    display @release
  end

  # GET /releases/new
  # GET /releases/new.xml
  def new
    @release = Release.new
    @release.service_id = params[:service_id]
    @service = Service.find(params[:service_id])
    display @release
  end

  # GET /services/1/releases/1/edit
  def edit
    @release = Release.get(params[:id])
    @service = @release.service
  end

  # POST /releases
  # POST /releases.xml
  def create
    @release = Release.new(params[:release])
    @service = Service.find(params[:service_id])

    respond_to do |format|
      if @release.save
        flash[:notice] = 'Release was successfully created.'
        format.html { redirect_to(service_url(@service.id)) }
        format.xml  { render :xml => @release, :status => :created, :location => @release }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /releases/1
  # PUT /releases/1.xml
  def update
    @release = Release.get(params[:id])

    respond_to do |format|
      if @release.update_attributes(params[:release])
        flash[:notice] = 'Release was successfully updated.'
        format.html { redirect_to(service_url(@release.service.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.xml
  def destroy
    @release = Release.get(params[:id])
    @release.destroy

    respond_to do |format|
      format.html { redirect_to(releases_url) }
      format.xml  { head :ok }
    end
  end
  
  def init_menu
    @menu = ["Administration", "Services"]
  end
end
