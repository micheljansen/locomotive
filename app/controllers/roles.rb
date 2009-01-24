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
    display @role
  end

  # POST /roles
  # POST /roles.xml
  def create
    @role = Role.new(params[:role])

    if @role.save
      # flash[:notice] = 'Role was successfully created.'
      redirect resource(@role)
    else
      render :new
    end
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.get(params[:id])

    if @role.update_attributes(params[:role])
      # flash[:notice] = 'Role was successfully updated.'
      redirect resource(@role)
    else
      render :edit
    end
  end

  def delete(id)
    @role = Role.get(id)
    display @role
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.get(params[:id])
    raise NotFound unless @role
    if @role.destroy
      redirect resource(:roles)
    else
      raise InternalServerError
    end
  end
  
  def init_menu
    @menu = ["Administration", "Roles"]
  end
  
end
