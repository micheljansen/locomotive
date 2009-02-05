module Locomotive
  class AdministrationDashboard < Locomotive::Application

    before :init_menu

    def index
      @clients = Locomotive::Client.all
      @services = Locomotive::Service.all
      render
    end

    def init_menu
      @menu = ["Administration", "Dashboard"]
    end
  end
end
