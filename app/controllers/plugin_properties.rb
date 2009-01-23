class PluginProperties < Application
  # GET /plugin_properties
  # GET /plugin_properties.xml
  def index
    @plugin_properties = PluginProperty.all
    display @plugin_properties
  end

  # GET /plugin_properties/1
  # GET /plugin_properties/1.xml
  def show
    @plugin_property = PluginProperty.get(params[:id])
    display @plugin_property
  end

  # GET /plugin_properties/new
  # GET /plugin_properties/new.xml
  def new
    @plugin_property = PluginProperty.new
    display @plugin_property
  end

  # GET /plugin_properties/1/edit
  def edit
    @plugin_property = PluginProperty.get(params[:id])
    display @plugin_property
  end

  # POST /plugin_properties
  # POST /plugin_properties.xml
  def create
    @plugin_property = PluginProperty.new(params[:plugin_property])

    if @plugin_property.save
      # flash[:notice] = 'PluginProperty was successfully created.'
      redirect resource(@plugin_property)
    else
      render :new
    end
  end

  # PUT /plugin_properties/1
  # PUT /plugin_properties/1.xml
  def update
    @plugin_property = PluginProperty.get(params[:id])

    if @plugin_property.update_attributes(params[:plugin_property])
      # flash[:notice] = 'PluginProperty was successfully updated.'
      redirect resource(@plugin_property)
    else
      render :edit
    end
  end

  def delete(id)
    @plugin_property = PluginProperty.get(id)
    display @plugin_property
  end

  # DELETE /plugin_properties/1
  # DELETE /plugin_properties/1.xml
  def destroy
    @plugin_property = PluginProperty.get(params[:id])
    raise NotFound unless @plugin_property
    if @plugin_property.destroy
      redirect resource(:plugin_instances)
    else
      raise InternalServerError
    end
  end
end
