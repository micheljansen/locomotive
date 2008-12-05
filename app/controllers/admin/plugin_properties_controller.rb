class Admin::PluginPropertiesController < ApplicationController
  # GET /plugin_properties
  # GET /plugin_properties.xml
  def index
    @plugin_properties = PluginProperty.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plugin_properties }
    end
  end

  # GET /plugin_properties/1
  # GET /plugin_properties/1.xml
  def show
    @plugin_property = PluginProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plugin_property }
    end
  end

  # GET /plugin_properties/new
  # GET /plugin_properties/new.xml
  def new
    @plugin_property = PluginProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plugin_property }
    end
  end

  # GET /plugin_properties/1/edit
  def edit
    @plugin_property = PluginProperty.find(params[:id])
  end

  # POST /plugin_properties
  # POST /plugin_properties.xml
  def create
    @plugin_property = PluginProperty.new(params[:plugin_property])

    respond_to do |format|
      if @plugin_property.save
        flash[:notice] = 'PluginProperty was successfully created.'
        format.html { redirect_to(@plugin_property) }
        format.xml  { render :xml => @plugin_property, :status => :created, :location => @plugin_property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plugin_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plugin_properties/1
  # PUT /plugin_properties/1.xml
  def update
    @plugin_property = PluginProperty.find(params[:id])

    respond_to do |format|
      if @plugin_property.update_attributes(params[:plugin_property])
        flash[:notice] = 'PluginProperty was successfully updated.'
        format.html { redirect_to(@plugin_property) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plugin_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plugin_properties/1
  # DELETE /plugin_properties/1.xml
  def destroy
    @plugin_property = PluginProperty.find(params[:id])
    @plugin_property.destroy

    respond_to do |format|
      format.html { redirect_to(plugin_properties_url) }
      format.xml  { head :ok }
    end
  end
end
