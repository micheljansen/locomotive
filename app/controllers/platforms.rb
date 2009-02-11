module Locomotive
  class Platforms < Locomotive::Application

    before :init_menu

    # GET /platforms
    # GET /platforms.xml
    def index
      @page_count, @platforms = Locomotive::Platform.paginated(:page => (params[:page] || 1).to_i)
      display @platforms
    end

    # GET /platforms/1
    # GET /platforms/1.xml
    def show(id)
      @platform = Locomotive::Platform.get(id)
      raise NotFound unless @platform
      display @platform
    end

    # GET /platforms/new
    def new
      only_provides :html
      @platform = Locomotive::Platform.new
      display @platform
    end

    # GET /platforms/1/edit
    def edit(id)
      only_provides :html
      @platform = Locomotive::Platform.get(id)
      raise NotFound unless @platform
      display @platform
    end

    # POST /platforms
    # POST /platforms.xml
    def create(platform)
      @platform = Locomotive::Platform.new(platform)

      if @platform.save
        redirect resource(@platform), :message => {:notice => "Platform was successfully created"}
      else
        render :new
      end
    end

    # PUT /platforms/1
    # PUT /platforms/1.xml
    def update(id, platform)
      @platform = Locomotive::Platform.get(id)
      raise NotFound unless @platform
      if @platform.update_attributes(platform)
        redirect resource(@platform), :message => {:notice => "Platform was successfully updated"}
      else
        render :edit
      end
    end

    def delete(id)
      @platform = Locomotive::Platform.get(id)
      raise NotFound unless @platform
      display @platform
    end

    # DELETE /platforms/1
    # DELETE /platforms/1.xml
    def destroy(id)
      @platform = Locomotive::Platform.get(id)
      raise NotFound unless @platform
      if @platform.destroy
        redirect resource(:platforms)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration", "Platforms"]
    end
  end
end
