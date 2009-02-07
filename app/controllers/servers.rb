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
    def show(id)
      @server = Locomotive::Server.get(id)
      raise NotFound unless @server
      display @server
    end

    # GET /servers/new
    def new
      only_provides :html
      @server = Locomotive::Server.new
      display @server
    end

    # GET /servers/1/edit
    def edit(id)
      only_provides :html
      @server = Locomotive::Server.get(id)
      raise NotFound unless @server
      display @server
    end

    # POST /servers
    # POST /servers.xml
    def create(server)
      @server = Locomotive::Server.new(server)

      if @server.save
        # flash[:notice] = 'Locomotive::Server was successfully created.'
        redirect resource(@server)
      else
        render :new
      end
    end

    # PUT /servers/1
    # PUT /servers/1.xml
    def update(id, server)
      @server = Locomotive::Server.get(id)
      raise NotFound unless @server
      if @server.update_attributes(server)
        # flash[:notice] = 'Locomotive::Server was successfully updated.'
        redirect resource(@server)
      else
        render :edit
      end
    end

    def delete(id)
      @server = Locomotive::Server.get(id)
      raise NotFound unless @server
      display @server
    end

    # DELETE /servers/1
    # DELETE /servers/1.xml
    def destroy(id)
      @server = Locomotive::Server.get(id)
      raise NotFound unless @server
      if @server.destroy
        redirect resource(:servers)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration","Locomotive::Servers"]
    end
  end
end
