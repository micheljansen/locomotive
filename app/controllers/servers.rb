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
  end

  # POST /servers
  # POST /servers.xml
  def create
    @server = Server.new(params[:server])

    respond_to do |format|
      if @server.save
        flash[:notice] = 'Server was successfully created.'
        format.html { redirect_to(server_url(@server.id)) }
        format.xml  { render :xml => @server, :status => :created, :location => @server }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @server.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /servers/1
  # PUT /servers/1.xml
  def update
    @server = Server.get(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        flash[:notice] = 'Server was successfully updated.'
        format.html { redirect_to(server_url(@server.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @server.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.xml
  def destroy
    @server = Server.get(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to(servers_url) }
      format.xml  { head :ok }
    end
  end
  
  def init_menu
    @menu = ["Administration","Servers"]
  end
end
