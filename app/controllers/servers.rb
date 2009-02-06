module Locomotive
  class Servers < Locomotive::Application

    before :init_menu

    # GET /servers
    # GET /servers.xml
    def index
      @page_count, @servers = Locomotive::Server.paginated(:page => (params[:page] || 1).to_i)
      display @servers
    end

    # GET /servers/1
    # GET /servers/1.xml
    def show
      @server = Locomotive::Server.get(params[:id])
      display @server
    end

    # GET /servers/new
    # GET /servers/new.xml
    def new
      @server = Locomotive::Server.new
      display @server
    end

    # GET /servers/1/edit
    def edit
      @server = Locomotive::Server.get(params[:id])
      display @server
    end

    # POST /servers
    # POST /servers.xml
    def create
      @server = Locomotive::Server.new(params[:server])

      if @server.save
        # flash[:notice] = 'Locomotive::Server was successfully created.'
        redirect resource(@server)
      else
        render :new
      end
    end

    # PUT /servers/1
    # PUT /servers/1.xml
    def update
      @server = Locomotive::Server.get(params[:id])

      if @server.update_attributes(params[:server])
        # flash[:notice] = 'Locomotive::Server was successfully updated.'
        redirect resource(@server)
      else
        render :edit
      end
    end

    def delete(id)
      @server = Locomotive::Server.get(id)
      display @server
    end

    # DELETE /servers/1
    # DELETE /servers/1.xml
    def destroy
      @server = Locomotive::Server.get(params[:id])
      raise NotFound unless @server
      if @server.destroy
        redirect resource(:servers)
      else
        raise InternalLocomotive::ServerError
      end
    end

    def init_menu
      @menu = ["Administration","Locomotive::Servers"]
    end
  end
end
