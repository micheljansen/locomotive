class Clients < Application
  
  before :init_menu
  
  # GET /clients
  # GET /clients.xml
  def index
    @clients = Client.all
    display @clients
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.get(params[:id])
    display @client
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new
    display @client
  end

  # GET /clients/1/edit
  def edit
    @client = Client.get(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        flash[:notice] = 'Client was successfully created.'
        format.html { redirect_to(client_url(@client.id)) }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.get(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        format.html { redirect_to(client_url(@client.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.get(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end
  
  def init_menu
    @menu = ["Administration","Clients"]
  end
  
end
