class AdministrationDashboard < Application

  before :init_menu
  
  def index
    @clients = Client.all
    @services = Service.all
  end
  
  def init_menu
    @menu = ["Administration", "Dashboard"]
  end
end
