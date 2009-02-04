module Locomotive
  class Clients < Application

    before :init_menu

    # GET /clients
    # GET /clients.xml
    def index
      @clients = Locomotive::Client.all
      display @clients
    end

    # GET /clients/1
    # GET /clients/1.xml
    def show
      @client = Locomotive::Client.get(params[:id])
      display @client
    end

    # GET /clients/new
    # GET /clients/new.xml
    def new
      @client = Locomotive::Client.new
      display @client
    end

    # GET /clients/1/edit
    def edit
      @client = Locomotive::Client.get(params[:id])
      display @client
    end

    # POST /clients
    # POST /clients.xml
    def create
      @client = Locomotive::Client.new(params[:client])

      if @client.save
        # flash[:notice] = 'Locomotive::Client was successfully created.'
        redirect resource(@client)
      else
        render :new
      end
    end

    # PUT /clients/1
    # PUT /clients/1.xml
    def update
      @client = Locomotive::Client.get(params[:id])

      if @client.update_attributes(params[:client])
        # flash[:notice] = 'Locomotive::Client was successfully updated.'
        redirect resource(@client)
      else
        display @client, :edit
      end
    end

    def delete(id)
      @client = Locomotive::Client.get(id)
      display @client
    end

    # DELETE /clients/1
    # DELETE /clients/1.xml
    def destroy
      @client = Locomotive::Client.get(params[:id])
      raise NotFound unless @client
      if @client.destroy
        redirect resource(:clients)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration","Locomotive::Clients"]
    end

  end
end
