class ReleaseVersionsController < ApplicationController
  # GET /release_versions
  # GET /release_versions.xml
  def index
    @release_versions = ReleaseVersion.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @release_versions }
    end
  end

  # GET /release_versions/1
  # GET /release_versions/1.xml
  def show
    @release_version = ReleaseVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @release_version }
    end
  end

  # GET /release_versions/new
  # GET /release_versions/new.xml
  def new
    @release_version = ReleaseVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @release_version }
    end
  end

  # GET /release_versions/1/edit
  def edit
    @release_version = ReleaseVersion.find(params[:id])
  end

  # POST /release_versions
  # POST /release_versions.xml
  def create
    @release_version = ReleaseVersion.new(params[:release_version])

    respond_to do |format|
      if @release_version.save
        flash[:notice] = 'ReleaseVersion was successfully created.'
        format.html { redirect_to(@release_version) }
        format.xml  { render :xml => @release_version, :status => :created, :location => @release_version }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @release_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /release_versions/1
  # PUT /release_versions/1.xml
  def update
    @release_version = ReleaseVersion.find(params[:id])

    respond_to do |format|
      if @release_version.update_attributes(params[:release_version])
        flash[:notice] = 'ReleaseVersion was successfully updated.'
        format.html { redirect_to(@release_version) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @release_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /release_versions/1
  # DELETE /release_versions/1.xml
  def destroy
    @release_version = ReleaseVersion.find(params[:id])
    @release_version.destroy

    respond_to do |format|
      format.html { redirect_to(release_versions_url) }
      format.xml  { head :ok }
    end
  end
end
