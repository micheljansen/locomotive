module Locomotive
  class Plugins < Locomotive::Application

    before :init_menu

    # GET /plugins
    # GET /plugins.xml
    def index
      #@plugins = Plugin.all
      #@plugins = []
      @plugins = Locomotive::PluginsModule.find_all
      Merb.logger.debug(Locomotive::PluginsModule.find_all.to_s)
      display @plugins
    end

    # GET /plugins/1
    # GET /plugins/1.xml
    def show(id)
      @plugin = Locomotive::Plugins[id]
      raise NotFound unless @plugin
      display @plugin
    end

    # GET /plugins/new
    def new
      only_provides :html
      @plugin = Locomotive::Plugin.new
      display @plugin
    end

    # GET /plugins/1/edit
    def edit(id)
      only_provides :html
      #@plugin = Plugin.get(id)
      @plugin = Locomotive::Plugins::HelloWorld
      raise NotFound unless @plugin
      display @plugin
    end

    def init_menu
      @menu = ["Settings", "Plugins"]
    end

  end
end
