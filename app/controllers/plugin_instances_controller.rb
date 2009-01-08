class PluginInstancesController < ApplicationController
  
  before_filter :init_menu
  
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

  # GET /plugin_instances/new/hello_world
  def new
    @plugin = Locomotive::Plugin.find_by_id(params[:id])
    
    # explode if the corresponding plugin cannot be found
    if @plugin.nil? then
      logger.error("Attempt to instantiate nonexisting plugin '#{params[:id]}'")
      flash[:notice] = "No plugin with ID '#{params[:id]}' exists."
      redirect_to :controller => "plugins", :action => "index"
      return
    end


    @plugin_instance = PluginInstance.new(:plugin_type => params[:id], 
                                          :version => @plugin.version)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /plugin_instances/1/edit
  def edit
    @plugin_instance = PluginInstance.find(params[:id])
    p @plugin_instance.plugin_properties
  end

  # POST /plugin_instances
  # POST /plugin_instances.xml
  def create
    @plugin_instance = PluginInstance.new(params[:plugin_instance])
    @plugin = @plugin_instance.plugin
    
    logger.debug("plugin_instance: #{y @plugin_instance} for plugin: #{y @plugin}")

    respond_to do |format|
      if @plugin_instance.save
        flash[:notice] = 'PluginInstance was successfully created.'
        format.html { redirect_to :action => "edit", :id => @plugin_instance }
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
      @plugin_instance.attributes = params[:plugin_instance]
      
      @plugin_instance.plugin_properties.each do |p|
        logger.debug("updating plugin_property #{p.key}")
        #y p
        #y params[:plugin_properties][p.id.to_s]
        p.attributes = params[:plugin_properties][p.id.to_s]  
      end
      
      if @plugin_instance.valid? && @plugin_instance.plugin_properties.all?(&:valid?)
          @plugin_instance.save!
          @plugin_instance.plugin_properties.each { |p| p.save! }
          flash[:notice] = 'PluginInstance was successfully updated.'
          format.html { redirect_to(@plugin_instance) }
        else
          render :action => 'edit'
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
  
  def init_menu
    @menu = ["Settings", "Plugins"]
  end
  
end
