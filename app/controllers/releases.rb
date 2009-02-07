module Locomotive
  class Releases < Locomotive::Application

    before :init_menu

    # GET /releases
    # GET /releases.xml
    def index
      @page_count, @releases = Locomotive::Release.paginated(:page => (params[:page] || 1).to_i)
      display @releases
    end

    # GET /releases/1
    # GET /releases/1.xml
    def show(id)
      @release = Locomotive::Release.get(id)
      raise NotFound unless @release
      display @release
    end

    # GET /releases/new
    def new
      only_provides :html
      @release = Locomotive::Release.new
      @release.service_id = params[:service_id]
      @service = Locomotive::Service.get(params[:service_id])
      display @release
    end

    # GET /services/1/releases/1/edit
    def edit(id)
      only_provides :html
      @release = Locomotive::Release.get(id)
      raise NotFound unless @release
      @service = @release.service
      display @release
    end

    # POST /releases
    # POST /releases.xml
    def create(release)
      @release = Locomotive::Release.new(release)
      @service = Service.get(params[:service_id])

      if @release.save
        redirect resource(@service), :message => {:notice => "Release was successfully created"}
      else
        render :new
      end
    end

    # PUT /releases/1
    # PUT /releases/1.xml
    def update(id, release)
      @release = Locomotive::Release.get(id)
      raise NotFound unless @release
      if @release.update_attributes(release)
        redirect resource(@release.service), :message => {:notice => "Release was successfully updated"}
      else
        render :edit
      end
    end

    def delete(id)
      @release = Locomotive::Release.get(id)
      raise NotFound unless @release
      display @release
    end

    # DELETE /releases/1
    # DELETE /releases/1.xml
    def destroy(id)
      @release = Locomotive::Release.get(id)
      raise NotFound unless @release
      if @release.destroy
        redirect resource(:releases)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration", "Services"]
    end
  end
end
