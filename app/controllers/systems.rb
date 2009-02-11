module Locomotive
  class Systems < Locomotive::Application

    before :init_menu

    # GET /systems
    # GET /systems.xml
    def index
      @page_count, @systems = Locomotive::System.paginated(:page => (params[:page] || 1).to_i)
      display @systems
    end

    # GET /systems/1
    # GET /systems/1.xml
    def show(id)
      @system = Locomotive::System.get(id)
      raise NotFound unless @system
      display @system
    end

    # GET /systems/new
    def new
      only_provides :html
      @system = Locomotive::System.new
      display @system
    end

    # GET /systems/1/edit
    def edit(id)
      only_provides :html
      @system = Locomotive::System.get(id)
      raise NotFound unless @system
      display @system
    end

    # POST /systems
    # POST /systems.xml
    def create(system)
      @system = Locomotive::System.new(system)

      if @system.save
        redirect resource(@system), :message => {:notice => "System was successfully created"}
      else
        render :new
      end
    end

    # PUT /systems/1
    # PUT /systems/1.xml
    def update(id, system)
      @system = Locomotive::System.get(id)
      raise NotFound unless @system
      if @system.update_attributes(system)
        redirect resource(@system), :message => {:notice => "System was successfully updated"}
      else
        render :edit
      end
    end

    def delete(id)
      @system = Locomotive::System.get(id)
      raise NotFound unless @system
      display @system
    end

    # DELETE /systems/1
    # DELETE /systems/1.xml
    def destroy(id)
      @system = Locomotive::System.get(id)
      raise NotFound unless @system
      if @system.destroy
        redirect resource(:systems)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration","Locomotive::Systems"]
    end
  end
end
