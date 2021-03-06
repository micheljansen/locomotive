module Locomotive
  class PluginInstances < Locomotive::Application

    before :init_menu

    # GET /plugin_instances
    # GET /plugin_instances.xml
    def index
      @plugin_instances = Locomotive::PluginInstance.all
      display @plugin_instance
    end

    # GET /plugin_instances/1
    # GET /plugin_instances/1.xml
    def show(id)
      @plugin_instance = Locomotive::PluginInstance.get(id)
      raise NotFound unless @plugin_instance
      display @plugin_instance
    end

    # GET /plugin_instances/new/hello_world
    def new
      only_provides :html
      @plugin = Locomotive::Locomotive::PluginInstance.all(:conditions => {:id => params[:id]})[0]

      # explode if the corresponding plugin cannot be found
      if @plugin.nil? then
        logger.error("Attempt to instantiate nonexisting plugin '#{params[:id]}'")
        # flash[:notice] = "No plugin with ID '#{params[:id]}' exists."
        redirect_to :controller => "plugins", :action => "index"
        return
      end


      @plugin_instance = Locomotive::PluginInstance.new(:plugin_type => params[:id],
                                            :version => @plugin.version)
      display @plugin_instance
    end

    # GET /plugin_instances/1/edit
    def edit(id)
      only_provides :html
      @plugin_instance = Locomotive::PluginInstance.get(id)
      raise NotFound unless @plugin_instance
      p @plugin_instance.plugin_properties
      display @plugin_instance
    end

    # POST /plugin_instances
    # POST /plugin_instances.xml
    def create(plugin_instance)
      @plugin_instance = Locomotive::PluginInstance.new(plugin_instance)
      @plugin = @plugin_instance.plugin

      logger.debug("plugin_instance: #{y @plugin_instance} for plugin: #{y @plugin}")

      if @plugin_instance.save
        redirect resource(@plugin_instance, :edit), :message => {:notice => "Plugin instance was successfully created"}
      else
        render :new
      end
    end

    # PUT /plugin_instances/1
    # PUT /plugin_instances/1.xml
    def update(id, plugin_instance)
      @plugin_instance = Locomotive::PluginInstance.get(id)
      raise NotFound unless @plugin_instance

      @plugin_instance.attributes = plugin_instance

      @plugin_instance.plugin_properties.each do |p|
        logger.debug("updating plugin_property #{p.key}")
          #y p
          #y params[:plugin_properties][p.id.to_s]
        p.attributes = params[:plugin_properties][p.id.to_s]
      end

      if @plugin_instance.valid? && @plugin_instance.plugin_properties.all?(&:valid?)
        @plugin_instance.save!
        @plugin_instance.plugin_properties.each { |p| p.save! }
        redirect resource(@plugin_instance), :message => {:notice => 'Plugin instance was successfully updated'}
      else
        render :edit
      end
    end

    def delete(id)
      @plugin_instance = Locomotive::PluginInstance.get(id)
      raise NotFound unless @plugin_instance
      display @plugin_instance
    end

    # DELETE /plugin_instances/1
    # DELETE /plugin_instances/1.xml
    def destroy(id)
      @plugin_instance = Locomotive::PluginInstance.get(id)
      raise NotFound unless @plugin_instance
      if @plugin_instance.destroy
        redirect resource(:plugin_instances)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Settings", "Plugins"]
    end

  end
end
