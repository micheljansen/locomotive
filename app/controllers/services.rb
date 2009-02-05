module Locomotive
  class Services < Locomotive::Application

    before :init_menu

    # GET /services
    # GET /services.xml
    def index
      @services = Locomotive::Service.all
      display @services
    end

    # GET /services/1
    # GET /services/1.xml
    def show
      @service = Locomotive::Service.get(params[:id])
      @releases = @service.releases
      @deployments = @service.deployments.all(:order => [:client_id.desc])
      display @service
    end

    # GET /services/new
    # GET /services/new.xml
    def new
      @service = Locomotive::Service.new
      display @service
    end

    # GET /services/1/edit
    def edit
      @service = Locomotive::Service.get(params[:id])
      display @service
    end

    # POST /services
    # POST /services.xml
    def create
      @service = Locomotive::Service.new(params[:service])

      if @service.save
        # flash[:notice] = 'Locomotive::Service was successfully created.'
        redirect resource(@service)
      else
        render :new
      end
    end

    # PUT /services/1
    # PUT /services/1.xml
    def update
      @service = Locomotive::Service.get(params[:id])

      if @service.update_attributes(params[:service])
        # flash[:notice] = 'Locomotive::Service was successfully updated.'
        redirect resource(@service)
      else
        render :edit
      end
    end

    def delete(id)
      @service = Locomotive::Service.get(id)
      display @service
    end

    # DELETE /services/1
    # DELETE /services/1.xml
    def destroy
      @service = Locomotive::Service.get(params[:id])
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
