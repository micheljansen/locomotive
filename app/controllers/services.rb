module Locomotive
  class Services < Locomotive::Application

    before :init_menu

    # GET /services
    # GET /services.xml
    def index
      @page_count, @services = Locomotive::Service.paginated(:page => (params[:page] || 1).to_i)
      display @services
    end

    # GET /services/1
    # GET /services/1.xml
    def show(id)
      @service = Locomotive::Service.get(id)
      raise NotFound unless @service
      @releases = @service.releases
      @deployments = @service.deployments.all(:order => [:client_id.desc])
      display @service
    end

    # GET /services/new
    def new
      only_provides :html
      @service = Locomotive::Service.new
      display @service
    end

    # GET /services/1/edit
    def edit(id)
      only_provides :html
      @service = Locomotive::Service.get(id)
      raise NotFound unless @service
      display @service
    end

    # POST /services
    # POST /services.xml
    def create(service)
      @service = Locomotive::Service.new(service)

      if @service.save
        # flash[:notice] = 'Locomotive::Service was successfully created.'
        redirect resource(@service)
      else
        render :new
      end
    end

    # PUT /services/1
    # PUT /services/1.xml
    def update(id, service)
      @service = Locomotive::Service.get(id)
      raise NotFound unless @service
      if @service.update_attributes(service)
        # flash[:notice] = 'Locomotive::Service was successfully updated.'
        redirect resource(@service)
      else
        render :edit
      end
    end

    def delete(id)
      @service = Locomotive::Service.get(id)
      raise NotFound unless @service
      display @service
    end

    # DELETE /services/1
    # DELETE /services/1.xml
    def destroy(id)
      @service = Locomotive::Service.get(id)
      raise NotFound unless @service
      if @service.destroy
        redirect resource(:services)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration","Locomotive::Services"]
    end
  end
end
