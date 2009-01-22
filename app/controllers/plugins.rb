class Plugins < Application
  
  before :init_menu
  
  # GET /plugins
  # GET /plugins.xml
  def index
    #@plugins = Plugin.all
    #@plugins = []
    @plugins = Locomotive::Plugins.find_all
    logger.debug(Locomotive::Plugins.find_all)
    display @plugins
  end

  # GET /plugins/1
  # GET /plugins/1.xml
  def show
    @plugin = Locomotive::Plugins[params[:id]]
    display @plugin
  end

  # GET /plugins/new
  # GET /plugins/new.xml
  def new
    @plugin = Plugin.new
    display @plugin
  end

  # GET /plugins/1/edit
  def edit
    #@plugin = Plugin.get(params[:id])
    @plugin = Locomotive::Plugins::HelloWorld
  end
  
  def init_menu
    @menu = ["Settings", "Plugins"]
  end

end
