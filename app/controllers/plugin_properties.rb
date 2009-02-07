module Locomotive
  class PluginProperties < Locomotive::Application
    # GET /plugin_properties
    # GET /plugin_properties.xml
    def index
      @plugin_properties = Locomotive::PluginProperty.all
      display @plugin_properties
    end

    # GET /plugin_properties/1
    # GET /plugin_properties/1.xml
    def show(id)
      @plugin_property = Locomotive::PluginProperty.get(id)
      raise NotFound unless @plugin_property
      display @plugin_property
    end

    # GET /plugin_properties/new
    def new
      only_provides :html
      @plugin_property = Locomotive::PluginProperty.new
      display @plugin_property
    end

    # GET /plugin_properties/1/edit
    def edit(id)
      only_provides :html
      @plugin_property = Locomotive::PluginProperty.get(id)
      raise NotFound unless @plugin_property
      display @plugin_property
    end

    # POST /plugin_properties
    # POST /plugin_properties.xml
    def create(plugin_property)
      @plugin_property = Locomotive::PluginProperty.new(plugin_property)

      if @plugin_property.save
        redirect resource(@plugin_property), :message => {:notice => "Plugin property was successfully created"}
      else
        render :new
      end
    end

    # PUT /plugin_properties/1
    # PUT /plugin_properties/1.xml
    def update(id, plugin_property)
      @plugin_property = Locomotive::PluginProperty.get(id)
      raise NotFound unless @plugin_property
      if @plugin_property.update_attributes(plugin_property)
        redirect resource(@plugin_property), :message => {:notice => "Plugin property was successfully updated"}
      else
        render :edit
      end
    end

    def delete(id)
      @plugin_property = Locomotive::PluginProperty.get(id)
      raise NotFound unless @plugin_property
      display @plugin_property
    end

    # DELETE /plugin_properties/1
    # DELETE /plugin_properties/1.xml
    def destroy(id)
      @plugin_property = Locomotive::PluginProperty.get(id)
      raise NotFound unless @plugin_property
      if @plugin_property.destroy
        redirect resource(:plugin_instances)
      else
        raise InternalServerError
      end
    end
  end
end
