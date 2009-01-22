class Roles < Application
  
  before :init_menu
  
  # GET /roles
  # GET /roles.xml
  def index
    @roles = Role.all
    display @roles
  end

  # GET /roles/1
  # GET /roles/1.xml
  def show
    @role = Role.get(params[:id])
    display @role
  end

  # GET /roles/new
  # GET /roles/new.xml
  def new
    @role = Role.new
    display @role
  end

  # GET /roles/1/edit
  def edit
    @role = Role.get(params[:id])
  end

  # POST /roles
  # POST /roles.xml
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        flash[:notice] = 'Role was successfully created.'
        format.html { redirect_to(role_url(@role.id)) }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.get(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        flash[:notice] = 'Role was successfully updated.'
        format.html { redirect_to(role_url(@role.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.get(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url) }
      format.xml  { head :ok }
    end
  end
  
  def init_menu
    @menu = ["Administration", "Roles"]
  end
  
end
