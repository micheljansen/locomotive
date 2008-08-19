class ContractsController < ApplicationController
  # GET /contracts
  # GET /contracts.xml
  def index
    @contracts = Contract.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contracts }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.xml
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract }
    end
  end

  # GET /clients/1/contracts/assign/2
  def new
    @services = Service.find(:all)
    @client = Client.find(params[:client_id])
    @contract = Contract.new    

    respond_to do |format|
      format.html
      #format.xml  { render :xml => @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
  end

  # POST /clients/1/contracts
  # POST /clients/1/contracts.xml
  def create
    @contract = Contract.new(params[:contract])
    @contract.client_id = params[:client_id]

    respond_to do |format|
      if @contract.save
        flash[:notice] = 'Contract was successfully created.'
        
        @client = @contract.client
        format.html { redirect_to(@client) }
        format.xml  { render :xml => @contract, :status => :created, :location => @contract }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.xml
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        flash[:notice] = 'Contract was successfully updated.'
        format.html { redirect_to(@contract) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.xml
  def destroy
    @client = Client.find(params[:client_id])
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      flash[:notice] = 'Contract was successfully cancelled.'
      format.html { redirect_to(client_url(@client)) }
      format.xml  { head :ok }
    end
  end
end
