module Locomotive
  class Dependencies < Application

    before :init_menu

    # GET /dependencies
    # GET /dependencies.xml
    def index
      @dependencies = Locomotive::Dependency.all
      display @dependencies
    end

    # GET /dependencies/1
    # GET /dependencies/1.xml
    def show
      @dependency = Locomotive::Dependency.get(params[:id])
      display @dependency
    end

    # GET /dependencies/new
    # GET /dependencies/new.xml
    def new
      @dependency = Locomotive::Dependency.new
      display @dependency
    end

    # GET /dependencies/1/edit
    def edit
      @dependency = Locomotive::Dependency.get(params[:id])
      display @dependency
    end

    # POST /dependencies
    # POST /dependencies.xml
    def create
      @dependency = Locomotive::Dependency.new(params[:dependency])

      if @dependency.save
        # flash[:notice] = 'Locomotive::Dependency was successfully created.'
        redirect resource(@dependency)
      else
        render :new
      end
    end

    # PUT /dependencies/1
    # PUT /dependencies/1.xml
    def update
      @dependency = Locomotive::Dependency.get(params[:id])

      if @dependency.update_attributes(params[:dependency])
        # flash[:notice] = 'Locomotive::Dependency was successfully updated.'
        redirect resource(@dependency)
      else
        render :edit
      end
    end

    def delete(id)
      @dependency = Locomotive::Dependency.get(id)
      display @dependency
    end

    # DELETE /dependencies/1
    # DELETE /dependencies/1.xml
    def destroy
      @dependency = Locomotive::Dependency.get(params[:id])
      raise NotFound unless @dependency
      if @dependency.destroy
        redirect resource(:dependencies)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration","Clients"]
    end
  end
end
