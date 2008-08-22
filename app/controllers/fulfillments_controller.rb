class FulfillmentsController < ApplicationController
  
  before_filter :init_menu
  before_filter :find_associated_server
  
#  # GET /fulfillments
#  # GET /fulfillments.xml
#  def index
#    @fulfillments = Fulfillment.find(:all)
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @fulfillments }
#    end
#  end
#
#  # GET /fulfillments/1
#  # GET /fulfillments/1.xml
#  def show
#    @fulfillment = Fulfillment.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @fulfillment }
#    end
#  end

  # GET /fulfillments/new
  # GET /fulfillments/new.xml
  def new
    @fulfillment = Fulfillment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fulfillment }
    end
  end

#  # GET /fulfillments/1/edit
#  def edit
#    @fulfillment = Fulfillment.find(params[:id])
#  end

  # POST /fulfillments
  # POST /fulfillments.xml
  def create
    @fulfillment = Fulfillment.new(params[:fulfillment])

    respond_to do |format|
      if @fulfillment.save
        flash[:notice] = 'Fulfillment was successfully created.'
        format.html { redirect_to(@fulfillment) }
        format.xml  { render :xml => @fulfillment, :status => :created, :location => @fulfillment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fulfillment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fulfillments/1
  # PUT /fulfillments/1.xml
  def update
    @fulfillment = Fulfillment.find(params[:id])

    respond_to do |format|
      if @fulfillment.update_attributes(params[:fulfillment])
        flash[:notice] = 'Fulfillment was successfully updated.'
        format.html { redirect_to(@fulfillment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fulfillment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fulfillments/1
  # DELETE /fulfillments/1.xml
  def destroy
    @fulfillment = Fulfillment.find(params[:id])
    @fulfillment.destroy

    respond_to do |format|
      format.html { redirect_to(fulfillments_url) }
      format.xml  { head :ok }
    end
  end
  
  # attempt to find the corresponding server if we're accessed
  # through a route containing a server, like
  # /servers/1/fulfillments/x
  def find_associated_server
    @server = nil
    server_id = params[:server_id]
    
    unless server_id.nil?
      @server = Server.find(server_id)
    end
  end
  
  # attempt to find the corresponding server if we're accessed
  # through a route containing a server, like
  # /servers/1/roles
  def find_associated_server
    @server = nil
    server_id = params[:server_id]
    
    unless server_id.nil?
      @server = Server.find(server_id)
    end
  end
  
  def init_menu
    @menu = ["Administration", "Servers"]
  end
  
end
