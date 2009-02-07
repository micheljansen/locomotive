module Locomotive
  class PlatformMemberships < Locomotive::Application

    before :find_platform
    before :find_server
    before :initialize_params

    # GET /platform_memberships
    # GET /platform_memberships.xml
    def index
      @platform_memberships = Locomotive::PlatformMembership.all
      display @platform_memberships
    end

    # GET /platform_memberships/1
    # GET /platform_memberships/1.xml
    def show(id)
      @platform_membership = Locomotive::PlatformMembership.get(id)
      raise NotFound unless @platform_membership
      display @platform_membership
    end

    # GET /platform_memberships/new
    def new
      only_provides :html
      @platform_membership = Locomotive::PlatformMembership.new
      display @platform_membership
    end

    # GET /platform_memberships/1/edit
    def edit(id)
      only_provides :html
      @platform_membership = Locomotive::PlatformMembership.get(id)
      raise NotFound unless @platform_membership
      display @platform_membership
    end

    # POST /platform_memberships
    # POST /platform_memberships.xml
    def create(platform_membership)
      @platform_membership = Locomotive::PlatformMembership.new(platform_membership)

      if @platform_membership.save
        # flash[:notice] = 'Locomotive::PlatformMembership was successfully created.'
        redirect resource(@platform)
      else
        render :new
      end
    end

    # PUT /platform_memberships/1
    # PUT /platform_memberships/1.xml
    def update(id, platform_membership)
      @platform_membership = Locomotive::PlatformMembership.get(id)
      raise NotFound unless @platform_membership
      if @platform_membership.update_attributes(platform_membership)
        # flash[:notice] = 'Locomotive::PlatformMembership was successfully updated.'
        redirect resource(@platform_membership)
      else
        render :edit
      end
    end

    def delete(id)
      @platform_membership = Locomotive::PlatformMembership.get(id)
      raise NotFound unless @platform_membership
      display @platform_membership
    end

    # DELETE /platform_memberships/1
    # DELETE /platform_memberships/1.xml
    def destroy(id)
      @platform_membership = Locomotive::PlatformMembership.get(id)
      raise NotFound unless @platform_membership
      if @platform_membership.destroy
        redirect resource(:platform_memberships)
        # TODO: rework JS for Merb format.js   { render :action => :refresh }
      else
        raise InternalServerError
      end
    end

    private

    # Actions
    def refresh
      #all the fun is in refresh.js.rjs ;)
    end
    # end

    def find_platform
      @platform ||= Locomotive::Platform.get(params[:platform_id]) if params[:platform_id]
    end

    def find_server
      @server ||= Locomotive::Server.get(params[:server_id]) if params[:server_id]
    end

    def initialize_params
      puts "initializing params"
      # y params
      #     p @platform
      #     p @server
      params[:platform_membership] ||= {}
      params[:platform_membership][:platform_id] ||= @platform.id if @platform
      params[:platform_membership][:server_id] ||= @server.id if @server
      #y params
    end
  end
end
