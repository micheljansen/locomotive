class ServiceInstancesController < ApplicationController
  
  before_filter :init_menu
  before_filter :find_client
  before_filter :find_service
  
  # GET /service_instances
  # GET /service_instances.xml
  def index
    @service_instances = 
      if @client
        @client.service_instances
      elsif @service
        @service.service_instances
      else
        ServiceInstance.find(:all)
      end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_instances }
    end
  end

  # GET /service_instances/1
  # GET /service_instances/1.xml
  def show
    @service_instance = ServiceInstance.find(params[:id])
    @client = @service_instance.client

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_instance }
    end
  end

  # GET /service_instances/new
  # GET /service_instances/new.xml
  def new
    @service_instance = ServiceInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_instance }
    end
  end

  # GET /service_instances/1/edit
  def edit
    @service_instance = ServiceInstance.find(params[:id])
  end

  # POST /service_instances
  # POST /service_instances.xml
  def create
    @service_instance = ServiceInstance.new(params[:service_instance])

    respond_to do |format|
      if @service_instance.save
        flash[:notice] = 'ServiceInstance was successfully created.'
        format.html { redirect_to(@service_instance) }
        format.xml  { render :xml => @service_instance, :status => :created, :location => @service_instance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_instances/1
  # PUT /service_instances/1.xml
  def update
    @service_instance = ServiceInstance.find(params[:id])

    respond_to do |format|
      if @service_instance.update_attributes(params[:service_instance])
        flash[:notice] = 'ServiceInstance was successfully updated.'
        format.html { redirect_to(@service_instance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_instances/1
  # DELETE /service_instances/1.xml
  def destroy
    @service_instance = ServiceInstance.find(params[:id])
    @service_instance.destroy

    respond_to do |format|
      format.html { redirect_to(service_instances_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def init_menu
    @menu = ["Manage", "Deploy"]
  end
  
  def find_client
    if params[:client_id]
      @client = Client.find(params[:client_id])
    end
  end
  
  def find_service
    if params[:service_id]
      @service = Service.find(params[:service_id])
    end
  end
end
