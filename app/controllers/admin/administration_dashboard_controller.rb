class AdministrationDashboardController < ApplicationController
  
  before_filter :init_menu
  
  def index
    @clients = Client.find(:all)
    @services = Service.find(:all)
  end
  
  def init_menu
    @menu = ["Administration", "Dashboard"]
  end
end
