module Locomotive
  class Roles < Locomotive::Application

    before :init_menu

    # GET /roles
    # GET /roles.xml
    def index
      @page_count, @roles = Locomotive::Role.paginated(:page => (params[:page] || 1).to_i)
      display @roles
    end

    # GET /roles/1
    # GET /roles/1.xml
    def show(id)
      @role = Locomotive::Role.get(id)
      raise NotFound unless @role
      display @role
    end

    # GET /roles/new
    def new
      only_provides :html
      @role = Locomotive::Role.new
      display @role
    end

    # GET /roles/1/edit
    def edit(id)
      only_provides :html
      @role = Locomotive::Role.get(id)
      raise NotFound unless @role
      display @role
    end

    # POST /roles
    # POST /roles.xml
    def create(role)
      @role = Locomotive::Role.new(role)

      if @role.save
        redirect resource(@role), :message => {:notice => 'Role was successfully created'}
      else
        render :new
      end
    end

    # PUT /roles/1
    # PUT /roles/1.xml
    def update(id, role)
      @role = Locomotive::Role.get(id)
      raise NotFound unless @role
      if @role.update_attributes(role)
        redirect resource(@role), :message => {:notice => "Role was successfully updated"}
      else
        render :edit
      end
    end

    def delete(id)
      @role = Locomotive::Role.get(id)
      raise NotFound unless @role
      display @role
    end

    # DELETE /roles/1
    # DELETE /roles/1.xml
    def destroy(id)
      @role = Locomotive::Role.get(id)
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
