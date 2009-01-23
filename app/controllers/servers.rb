class Servers < Application

  before :init_menu
  
  # GET /servers
  # GET /servers.xml
  def index
    @servers = Server.all
    display @servers
  end

  # GET /servers/1
  # GET /servers/1.xml
  def show
    @server = Server.get(params[:id])
    display @server
  end

  # GET /servers/new
  # GET /servers/new.xml
  def new
    @server = Server.new
    display @server
  end

  # GET /servers/1/edit
  def edit
    @server = Server.get(params[:id])
    display @server
  end

  # POST /servers
  # POST /servers.xml
  def create
    @server = Server.new(params[:server])

    if @server.save
      # flash[:notice] = 'Server was successfully created.'
      redirect resource(@server)
    else
      render :new
    end
  end

  # PUT /servers/1
  # PUT /servers/1.xml
  def update
    @server = Server.get(params[:id])

    if @server.update_attributes(params[:server])
      # flash[:notice] = 'Server was successfully updated.'
      redirect resource(@server)
    else
      render :edit
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.xml
  def destroy
    @server = Server.get(params[:id])
    raise NotFound unless @server
    if @server.destroy
      redirect resource(:servers)
    else
      raise InternalServerError
    end
  end
  
  def init_menu
    @menu = ["Administration","Servers"]
  end
end