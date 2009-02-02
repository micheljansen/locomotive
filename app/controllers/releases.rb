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
    @service = Service.get(params[:service_id])
    display @release
  end

  # GET /services/1/releases/1/edit
  def edit
    @release = Release.get(params[:id])
    @service = @release.service
    display @release
  end

  # POST /releases
  # POST /releases.xml
  def create
    @release = Release.new(params[:release])
    @service = Service.get(params[:service_id])

    if @release.save
      #  flash[:notice] = 'Release was successfully created.'
      redirect resource(@service)
    else
      render :new
    end
  end

  # PUT /releases/1
  # PUT /releases/1.xml
  def update
    @release = Release.get(params[:id])

    if @release.update_attributes(params[:release])
      # flash[:notice] = 'Release was successfully updated.'
      redirect resource(@release.service)
    else
      render :edit
    end
  end

  def delete(id)
    @release = Release.get(id)
    display @release
  end

  # DELETE /releases/1
  # DELETE /releases/1.xml
  def destroy
    @release = Release.get(params[:id])
    raise NotFound unless @release
    if @release.destroy
      redirect resource(:releases)
    else
      raise InternalServerError
    end
  end

  def init_menu
    @menu = ["Administration", "Services"]
  end
end
