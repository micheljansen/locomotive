module Locomotive
  class Roles < Locomotive::Application

    before :init_menu

    # GET /roles
    # GET /roles.xml
    def index
      @roles = Locomotive::Role.all
      display @roles
    end

    # GET /roles/1
    # GET /roles/1.xml
    def show
      @role = Locomotive::Role.get(params[:id])
      display @role
    end

    # GET /roles/new
    # GET /roles/new.xml
    def new
      @role = Locomotive::Role.new
      display @role
    end

    # GET /roles/1/edit
    def edit
      @role = Locomotive::Role.get(params[:id])
      display @role
    end

    # POST /roles
    # POST /roles.xml
    def create
      @role = Locomotive::Role.new(params[:role])

      if @role.save
        # flash[:notice] = 'Locomotive::Role was successfully created.'
        redirect resource(@role)
      else
        render :new
      end
    end

    # PUT /roles/1
    # PUT /roles/1.xml
    def update
      @role = Locomotive::Role.get(params[:id])

      if @role.update_attributes(params[:role])
        # flash[:notice] = 'Locomotive::Role was successfully updated.'
        redirect resource(@role)
      else
        render :edit
      end
    end

    def delete(id)
      @role = Locomotive::Role.get(id)
      display @role
    end

    # DELETE /roles/1
    # DELETE /roles/1.xml
    def destroy
      @role = Locomotive::Role.get(params[:id])
      raise NotFound unless @role
      if @role.destroy
        redirect resource(:roles)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration", "Locomotive::Roles"]
    end

  end
end
