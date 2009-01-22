class Dependencies < Application
  
  before :init_menu
  
  # GET /dependencies
  # GET /dependencies.xml
  def index
    @dependencies = Dependency.all
    display @dependencies
  end

  # GET /dependencies/1
  # GET /dependencies/1.xml
  def show
    @dependency = Dependency.get(params[:id])
    display @dependency
  end

  # GET /dependencies/new
  # GET /dependencies/new.xml
  def new
    @dependency = Dependency.new
    display @dependency
  end

  # GET /dependencies/1/edit
  def edit
    @dependency = Dependency.get(params[:id])
    display @dependency
  end

  # POST /dependencies
  # POST /dependencies.xml
  def create
    @dependency = Dependency.new(params[:dependency])

    if @dependency.save
      # flash[:notice] = 'Dependency was successfully created.'
      redirect resource(@dependency)
    else
      render :new
    end
  end

  # PUT /dependencies/1
  # PUT /dependencies/1.xml
  def update
    @dependency = Dependency.get(params[:id])

    if @dependency.update_attributes(params[:dependency])
      # flash[:notice] = 'Dependency was successfully updated.'
      redirect resource(@dependency)
    else
      render :edit
    end
  end

  # DELETE /dependencies/1
  # DELETE /dependencies/1.xml
  def destroy
    @dependency = Dependency.get(params[:id])
    @dependency.destroy

    respond_to do |format|
      format.html { redirect_to(dependencies_url) }
      format.xml  { head :ok }
    end
  end
  
  def init_menu
    @menu = ["Administration","Clients"]
  end
end
