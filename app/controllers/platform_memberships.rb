class PlatformMemberships < Application
  
  before :find_platform
  before :find_server
  before :initialize_params
  
  # GET /platform_memberships
  # GET /platform_memberships.xml
  def index
    @platform_memberships = PlatformMembership.all
    display @platform_memberships
  end

  # GET /platform_memberships/1
  # GET /platform_memberships/1.xml
  def show
    @platform_membership = PlatformMembership.get(params[:id])
    display @platform_membership
  end

  # GET /platform_memberships/new
  # GET /platform_memberships/new.xml
  def new
    @platform_membership = PlatformMembership.new
    display @platform_membership
  end

  # GET /platform_memberships/1/edit
  def edit
    @platform_membership = PlatformMembership.get(params[:id])
    display @platform_membership
  end

  # POST /platform_memberships
  # POST /platform_memberships.xml
  def create
    @platform_membership = PlatformMembership.new(params[:platform_membership])

    if @platform_membership.save
      # flash[:notice] = 'PlatformMembership was successfully created.'
      redirect resource(@platform)
    else
      render :new
    end
  end

  # PUT /platform_memberships/1
  # PUT /platform_memberships/1.xml
  def update
    @platform_membership = PlatformMembership.get(params[:id])

    if @platform_membership.update_attributes(params[:platform_membership])
      # flash[:notice] = 'PlatformMembership was successfully updated.'
      redirect resource(@platform_membership)
    else
      render :edit 
    end
  end

  # DELETE /platform_memberships/1
  # DELETE /platform_memberships/1.xml
  def destroy
    @platform_membership = PlatformMembership.get(params[:id])
    raise NotFound unless @platform_membership
    if @platform_membership.destroy
      redirect resource(:platform_memberships)
      # TODO: rework JS for Merb format.js   { render :action => :refresh }
    else
      raise InternalServerError
    end
  end
  
  private
  
  # Actions
  def refresh
    #all the fun is in refresh.js.rjs ;)
  end
  # end
  
  def find_platform
    @platform ||= Platform.find(params[:platform_id]) if params[:platform_id]
  end
  
  def find_server
    @server ||= Server.find(params[:server_id]) if params[:server_id]
  end
  
  def initialize_params
    puts "initializing params"
    # y params
    #     p @platform
    #     p @server
    params[:platform_membership] ||= {}
    params[:platform_membership][:platform_id] ||= @platform.id if @platform
    params[:platform_membership][:server_id] ||= @server.id if @server
    #y params
  end
end
