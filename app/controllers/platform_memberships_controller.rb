class PlatformMembershipsController < ApplicationController
  
  before_filter :find_platform
  before_filter :find_server
  before_filter :initialize_params
  
  # GET /platform_memberships
  # GET /platform_memberships.xml
  def index
    @platform_memberships = PlatformMembership.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @platform_memberships }
    end
  end

  # GET /platform_memberships/1
  # GET /platform_memberships/1.xml
  def show
    @platform_membership = PlatformMembership.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @platform_membership }
    end
  end

  # GET /platform_memberships/new
  # GET /platform_memberships/new.xml
  def new
    @platform_membership = PlatformMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @platform_membership }
    end
  end

  # GET /platform_memberships/1/edit
  def edit
    @platform_membership = PlatformMembership.get(params[:id])
  end

  # POST /platform_memberships
  # POST /platform_memberships.xml
  def create
    @platform_membership = PlatformMembership.new(params[:platform_membership])

    respond_to do |format|
      if @platform_membership.save
        flash[:notice] = 'PlatformMembership was successfully created.'
        format.html { redirect_to(platform_url(@platform.id)) }
        format.xml  { render :xml => @platform_membership, :status => :created, :location => platform_platform_membership_path(@platform, @platform_membership) }
        format.js  { render :action => :refresh }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @platform_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /platform_memberships/1
  # PUT /platform_memberships/1.xml
  def update
    @platform_membership = PlatformMembership.get(params[:id])

    respond_to do |format|
      if @platform_membership.update_attributes(params[:platform_membership])
        flash[:notice] = 'PlatformMembership was successfully updated.'
        format.html { redirect_to(platform_membership_url(@platform_membership.id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @platform_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /platform_memberships/1
  # DELETE /platform_memberships/1.xml
  def destroy
    @platform_membership = PlatformMembership.get(params[:id])
    @platform_membership.destroy

    respond_to do |format|
      format.html { redirect_to(platform_memberships_url) }
      format.xml  { head :ok }
      format.js   { render :action => :refresh }
    end
  end
  
  private
  
  # Actions
  def refresh
    #all the fun is in refresh.js.rjs ;)
  end
  # end
  
  def find_platform
    @platform ||= Platform.find(params[:platform_id]) if params[:platform_id]
  end
  
  def find_server
    @server ||= Server.find(params[:server_id]) if params[:server_id]
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
