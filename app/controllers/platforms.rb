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
    def show
      @platform = Locomotive::Platform.get(params[:id])
      display @platform
    end

    # GET /platforms/new
    # GET /platforms/new.xml
    def new
      @platform = Locomotive::Platform.new
      display @platform
    end

    # GET /platforms/1/edit
    def edit
      @platform = Locomotive::Platform.get(params[:id])
      display @platform
    end

    # POST /platforms
    # POST /platforms.xml
    def create
      @platform = Locomotive::Platform.new(params[:platform])

      if @platform.save
        # flash[:notice] = 'Locomotive::Platform was successfully created.'
        redirect resource(@platform)
      else
        render :new
      end
    end

    # PUT /platforms/1
    # PUT /platforms/1.xml
    def update
      @platform = Locomotive::Platform.get(params[:id])

      if @platform.update_attributes(params[:platform])
        # flash[:notice] = 'Locomotive::Platform was successfully updated.'
        redirect resource(@platform)
      else
        render :edit
      end
    end

    def delete(id)
      @platform = Locomotive::Platform.get(id)
      display @platform
    end

    # DELETE /platforms/1
    # DELETE /platforms/1.xml
    def destroy
      @platform = Locomotive::Platform.get(params[:id])
      raise NotFound unless @platform
      if @platform.destroy
        redirect resource(:platforms)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration", "Locomotive::Platforms"]
    end
  end
end
