module Locomotive
  class Clients < Locomotive::Application

    before :init_menu

    # GET /clients
    # GET /clients.xml
    def index
      @page_count, @clients = Locomotive::Client.paginated(:page => (params[:page] || 1).to_i)
      display @clients
    end

    # GET /clients/1
    # GET /clients/1.xml
    def show(id)
      @client = Locomotive::Client.get(id)
      raise NotFound unless @client
      display @client
    end

    # GET /clients/new
    def new
      only_provides :html
      @client = Locomotive::Client.new
      display @client
    end

    # GET /clients/1/edit
    def edit(id)
      only_provides :html
      @client = Locomotive::Client.get(id)
      raise NotFound unless @client
      display @client
    end

    # POST /clients
    # POST /clients.xml
    def create(client)
      @client = Locomotive::Client.new(client)

      if @client.save
        redirect resource(@client), :message => {:notice => "Client was successfully created"}
      else
        render :new
      end
    end

    # PUT /clients/1
    # PUT /clients/1.xml
    def update(id, client)
      @client = Locomotive::Client.get(id)
      raise NotFound unless @client
      if @client.update_attributes(client)
        redirect resource(@client), :message => {:notice => "Client was successfully updated"}
      else
        display @client, :edit
      end
    end

    def delete(id)
      @client = Locomotive::Client.get(id)
      raise NotFound unless @client
      display @client
    end

    # DELETE /clients/1
    # DELETE /clients/1.xml
    def destroy(id)
      @client = Locomotive::Client.get(id)
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
