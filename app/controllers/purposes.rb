class Purposes < Application
  
  before :init_menu
  before :find_associated_server
  
#  # GET /purposes
#  # GET /purposes.xml
  def index  
    @purposes = @server.purposes
    display @purposes
  end

#  TODO: remove this action when no longer debugging
#  # GET /purposes/1
#  # GET /purposes/1.xml
  def show
    @purpose = Purpose.get(params[:id])
    display @purpose
  end

  # GET /purposes/new
  # GET /purposes/new.xml
  def new
    @purpose = Purpose.new
    @purpose.server_id = @server.id
    display @purpose
  end

#  # GET /purposes/1/edit
#  def edit
#    @purpose = Purpose.get(params[:id])
#  end

  # POST /purposes
  # POST /purposes.xml
  def create
    @purpose = Purpose.new(params[:purpose])

    respond_to do |format|
      if @purpose.save
        flash[:notice] = 'Role was successfully created.'
        format.html { redirect_to(server_url(@server.id)) }
        format.xml  { render :xml => @purpose, :status => :created, :location => @purpose }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purpose.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purposes/1
  # PUT /purposes/1.xml
  def update
    @purpose = Purpose.get(params[:id])

    respond_to do |format|
      if @purpose.update_attributes(params[:purpose])
        flash[:notice] = 'Role was successfully updated.'
        format.html { redirect_to(server_url(@server.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purpose.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purposes/1
  # DELETE /purposes/1.xml
  def destroy
    @purpose = Purpose.get(params[:id])
    @purpose.destroy

    respond_to do |format|
      format.html { redirect_to(server_url(@server.id)) }
      format.xml  { head :ok }
    end
  end
  
  # attempt to find the corresponding server if we're accessed
  # through a route containing a server, like
  # /servers/1/purposes/x
  def find_associated_server
    @server = nil
    server_id = params[:server_id]
    
    unless server_id.nil?
      @server = Server.find(server_id)
    end
  end
  
  # attempt to find the corresponding server if we're accessed
  # through a route containing a server, like
  # /servers/1/roles
  def find_associated_server
    @server = nil
    server_id = params[:server_id]
    
    unless server_id.nil?
      @server = Server.find(server_id)
    end
  end
  
  def init_menu
    @menu = ["Administration", "Servers"]
  end
  
end
