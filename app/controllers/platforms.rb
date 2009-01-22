class Platforms < Application
  
  before :init_menu
  
  # GET /platforms
  # GET /platforms.xml
  def index
    @platforms = Platform.all
    display @platforms
  end

  # GET /platforms/1
  # GET /platforms/1.xml
  def show
    @platform = Platform.get(params[:id])
    display @platform
  end

  # GET /platforms/new
  # GET /platforms/new.xml
  def new
    @platform = Platform.new
    display @platform
  end

  # GET /platforms/1/edit
  def edit
    @platform = Platform.get(params[:id])
    display @platform
  end

  # POST /platforms
  # POST /platforms.xml
  def create
    @platform = Platform.new(params[:platform])

    if @platform.save
      # flash[:notice] = 'Platform was successfully created.'
      redirect resource(@platform)
    else
      render :new
    end
  end

  # PUT /platforms/1
  # PUT /platforms/1.xml
  def update
    @platform = Platform.get(params[:id])

    if @platform.update_attributes(params[:platform])
      # flash[:notice] = 'Platform was successfully updated.'
      redirect resource(@platform)
    else
      render :edit
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.xml
  def destroy
    @platform = Platform.get(params[:id])
    @platform.destroy

    respond_to do |format|
      format.html { redirect_to(platforms_url) }
      format.xml  { head :ok }
    end
  end
  
  def init_menu
    @menu = ["Administration", "Platforms"]
  end
end
