class ApplicationInstancesController < ApplicationController
  # GET /application_instances
  # GET /application_instances.xml
  def index
    @application_instances = ApplicationInstance.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @application_instances }
    end
  end

  # GET /application_instances/1
  # GET /application_instances/1.xml
  def show
    @application_instance = ApplicationInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @application_instance }
    end
  end

  # GET /application_instances/new
  # GET /application_instances/new.xml
  def new
    @application_instance = ApplicationInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @application_instance }
    end
  end

  # GET /application_instances/1/edit
  def edit
    @application_instance = ApplicationInstance.find(params[:id])
  end

  # POST /application_instances
  # POST /application_instances.xml
  def create
    @application_instance = ApplicationInstance.new(params[:application_instance])

    respond_to do |format|
      if @application_instance.save
        flash[:notice] = 'ApplicationInstance was successfully created.'
        format.html { redirect_to(@application_instance) }
        format.xml  { render :xml => @application_instance, :status => :created, :location => @application_instance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @application_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /application_instances/1
  # PUT /application_instances/1.xml
  def update
    @application_instance = ApplicationInstance.find(params[:id])

    respond_to do |format|
      if @application_instance.update_attributes(params[:application_instance])
        flash[:notice] = 'ApplicationInstance was successfully updated.'
        format.html { redirect_to(@application_instance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @application_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /application_instances/1
  # DELETE /application_instances/1.xml
  def destroy
    @application_instance = ApplicationInstance.find(params[:id])
    @application_instance.destroy

    respond_to do |format|
      format.html { redirect_to(application_instances_url) }
      format.xml  { head :ok }
    end
  end
end
