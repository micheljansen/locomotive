module Locomotive
  class Purposes < Locomotive::Application

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
    def show(id)
      @purpose = Locomotive::Purpose.get(id)
      raise NotFound unless @purpose
      display @purpose
    end

    # GET /purposes/new
    def new
      only_provides :html
      @purpose = Locomotive::Purpose.new
      @purpose.server_id = @server.id
      display @purpose
    end

  #  # GET /purposes/1/edit
  #  def edit(id)
  #    only_provides :html
  #    @purpose = Locomotive::Purpose.get(id)
  #    raise NotFound unless @purpose
  #  end

    # POST /purposes
    # POST /purposes.xml
    def create(purpose)
      @purpose = Locomotive::Purpose.new(purpose)

      if @purpose.save
        redirect resource(@server), :message => {:notice => "Role was successfully created"}
      else
        render :new
      end
    end

    # PUT /purposes/1
    # PUT /purposes/1.xml
    def update(id, purpose)
      @purpose = Locomotive::Purpose.get(id)
      raise NotFound unless @purpose
      if @purpose.update_attributes(purpose)
        redirect resource(@server), :message => {:notice => 'Role was successfully updated'}
      else
        render :edit
      end
    end

    def delete(id)
      @purpose = Locomotive::Purpose.get(id)
      raise NotFound unless @purpose
      display @purpose
    end

    # DELETE /purposes/1
    # DELETE /purposes/1.xml
    def destroy(id)
      @purpose = Locomotive::Purpose.get(id)
      raise NotFound unless @purpose
      if @purpose.destroy
        redirect resource(@server)
      else
        raise InternalServerError
      end
    end

    # attempt to find the corresponding server if we're accessed
    # through a route containing a server, like
    # /servers/1/purposes/x
    def find_associated_server
      @server = nil
      server_id = params[:server_id]

      unless server_id.nil?
        @server = Locomotive::Server.get(server_id)
      end
    end

    # attempt to find the corresponding server if we're accessed
    # through a route containing a server, like
    # /servers/1/roles
    def find_associated_server
      @server = nil
      server_id = params[:server_id]

      unless server_id.nil?
        @server = Locomotive::Server.get(server_id)
      end
    end

    def init_menu
      @menu = ["Administration", "Servers"]
    end

  end
end
