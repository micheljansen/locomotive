class PluginsController < ApplicationController
  
  before_filter :init_menu
  
  # GET /plugins
  # GET /plugins.xml
  def index
    #@plugins = Plugin.find(:all)
    #@plugins = []
    @plugins = Locomotive::Plugin.find_all
    logger.debug(Locomotive::Plugin.find_all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plugins }
    end
  end

  # GET /plugins/1
  # GET /plugins/1.xml
  def show
    @plugin = Locomotive::Plugin.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plugin }
    end
  end

  # GET /plugins/new
  # GET /plugins/new.xml
  def new
    @plugin = Plugin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plugin }
    end
  end

  # GET /plugins/1/edit
  def edit
    #@plugin = Plugin.find(params[:id])
    @plugin = Locomotive::Plugins::HelloWorld
  end
  
  def init_menu
    @menu = ["Hello World"]
  end

end
