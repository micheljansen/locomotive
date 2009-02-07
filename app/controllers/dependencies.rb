module Locomotive
  class Dependencies < Locomotive::Application

    before :init_menu

    # GET /dependencies
    # GET /dependencies.xml
    def index
      @dependencies = Locomotive::Dependency.all
      display @dependencies
    end

    # GET /dependencies/1
    # GET /dependencies/1.xml
    def show(id)
      @dependency = Locomotive::Dependency.get(id)
      raise NotFound unless @dependency
      display @dependency
    end

    # GET /dependencies/new
    def new
      only_provides :html
      @dependency = Locomotive::Dependency.new
      display @dependency
    end

    # GET /dependencies/1/edit
    def edit(id)
      only_provides :html
      @dependency = Locomotive::Dependency.get(id)
      raise NotFound unless @dependency
      display @dependency
    end

    # POST /dependencies
    # POST /dependencies.xml
    def create(dependency)
      @dependency = Locomotive::Dependency.new(dependency)

      if @dependency.save
        # flash[:notice] = 'Locomotive::Dependency was successfully created.'
        redirect resource(@dependency)
      else
        render :new
      end
    end

    # PUT /dependencies/1
    # PUT /dependencies/1.xml
    def update(id, dependency)
      @dependency = Locomotive::Dependency.get(id)
      raise NotFound unless @dependency
      if @dependency.update_attributes(dependency)
        # flash[:notice] = 'Locomotive::Dependency was successfully updated.'
        redirect resource(@dependency)
      else
        render :edit
      end
    end

    def delete(id)
      @dependency = Locomotive::Dependency.get(id)
      raise NotFound unless @dependency
      display @dependency
    end

    # DELETE /dependencies/1
    # DELETE /dependencies/1.xml
    def destroy(id)
      @dependency = Locomotive::Dependency.get(id)
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
