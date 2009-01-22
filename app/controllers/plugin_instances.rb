class PluginInstances < Application
  
  before :init_menu
  
  # GET /plugin_instances
  # GET /plugin_instances.xml
  def index
    @plugin_instances = PluginInstance.all
    display @plugin_instance
  end

  # GET /plugin_instances/1
  # GET /plugin_instances/1.xml
  def show
    @plugin_instance = PluginInstance.get(params[:id])
    display @plugin_instance
  end

  # GET /plugin_instances/new/hello_world
  def new
    @plugin = Locomotive::PluginInstance.all(:conditions => {:id => params[:id]})[0]
    
    # explode if the corresponding plugin cannot be found
    if @plugin.nil? then
      logger.error("Attempt to instantiate nonexisting plugin '#{params[:id]}'")
      # flash[:notice] = "No plugin with ID '#{params[:id]}' exists."
      redirect_to :controller => "plugins", :action => "index"
      return
    end


    @plugin_instance = PluginInstance.new(:plugin_type => params[:id], 
                                          :version => @plugin.version)
    display @plugin_instance
  end

  # GET /plugin_instances/1/edit
  def edit
    @plugin_instance = PluginInstance.get(params[:id])
    p @plugin_instance.plugin_properties
    display @plugin_instance
  end

  # POST /plugin_instances
  # POST /plugin_instances.xml
  def create
    @plugin_instance = PluginInstance.new(params[:plugin_instance])
    @plugin = @plugin_instance.plugin
    
    logger.debug("plugin_instance: #{y @plugin_instance} for plugin: #{y @plugin}")

    if @plugin_instance.save
      # flash[:notice] = 'PluginInstance was successfully created.'
      redirect resource(@plugin_instance, :edit)
    else
      render :new
    end
  end

  # PUT /plugin_instances/1
  # PUT /plugin_instances/1.xml
  def update
    @plugin_instance = PluginInstance.get(params[:id])
    
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
       #  flash[:notice] = 'PluginInstance was successfully updated.'
      redirect resource(@plugin_instance)
    else
      render :edit
    end
  end

  # DELETE /plugin_instances/1
  # DELETE /plugin_instances/1.xml
  def destroy
    @plugin_instance = PluginInstance.get(params[:id])
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
