class PluginInstancesController < ApplicationController
  # GET /plugin_instances
  # GET /plugin_instances.xml
  def index
    @plugin_instances = PluginInstance.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plugin_instances }
    end
  end

  # GET /plugin_instances/1
  # GET /plugin_instances/1.xml
  def show
    @plugin_instance = PluginInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plugin_instance }
    end
  end

  # GET /plugin_instances/new
  # GET /plugin_instances/new.xml
  def new
    @plugin_instance = PluginInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plugin_instance }
    end
  end

  # GET /plugin_instances/1/edit
  def edit
    @plugin_instance = PluginInstance.find(params[:id])
    @plugin = Locomotive::Plugin.find_by_id(@plugin_instance.plugin_type)
  end

  # POST /plugin_instances
  # POST /plugin_instances.xml
  def create
    @plugin_instance = PluginInstance.new(params[:plugin_instance])

    respond_to do |format|
      if @plugin_instance.save
        flash[:notice] = 'PluginInstance was successfully created.'
        format.html { redirect_to(@plugin_instance) }
        format.xml  { render :xml => @plugin_instance, :status => :created, :location => @plugin_instance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plugin_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plugin_instances/1
  # PUT /plugin_instances/1.xml
  def update
    @plugin_instance = PluginInstance.find(params[:id])

    respond_to do |format|
      if @plugin_instance.update_attributes(params[:plugin_instance])
        flash[:notice] = 'PluginInstance was successfully updated.'
        format.html { redirect_to(@plugin_instance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plugin_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plugin_instances/1
  # DELETE /plugin_instances/1.xml
  def destroy
    @plugin_instance = PluginInstance.find(params[:id])
    @plugin_instance.destroy

    respond_to do |format|
      format.html { redirect_to(plugin_instances_url) }
      format.xml  { head :ok }
    end
  end
end
