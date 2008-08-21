class PlatformMembershipsController < ApplicationController
  # GET /platform_memberships
  # GET /platform_memberships.xml
  def index
    @platform_memberships = PlatformMembership.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @platform_memberships }
    end
  end

  # GET /platform_memberships/1
  # GET /platform_memberships/1.xml
  def show
    @platform_membership = PlatformMembership.find(params[:id])

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
    @platform_membership = PlatformMembership.find(params[:id])
  end

  # POST /platform_memberships
  # POST /platform_memberships.xml
  def create
    @platform_membership = PlatformMembership.new(params[:platform_membership])

    respond_to do |format|
      if @platform_membership.save
        flash[:notice] = 'PlatformMembership was successfully created.'
        format.html { redirect_to(@platform_membership) }
        format.xml  { render :xml => @platform_membership, :status => :created, :location => @platform_membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @platform_membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /platform_memberships/1
  # PUT /platform_memberships/1.xml
  def update
    @platform_membership = PlatformMembership.find(params[:id])

    respond_to do |format|
      if @platform_membership.update_attributes(params[:platform_membership])
        flash[:notice] = 'PlatformMembership was successfully updated.'
        format.html { redirect_to(@platform_membership) }
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
    @platform_membership = PlatformMembership.find(params[:id])
    @platform_membership.destroy

    respond_to do |format|
      format.html { redirect_to(platform_memberships_url) }
      format.xml  { head :ok }
    end
  end
end
