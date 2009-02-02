class Contracts < Application

  before :init_menu

  # GET /contracts
  # GET /contracts.xml
  def index
    @contracts = Contract.all
    display @contracts
  end

  # GET /contracts/1
  # GET /contracts/1.xml
  def show
    @contract = Contract.get(params[:id])
    display @contract
  end

  # GET /clients/1/contracts/assign/2
  def new
    @services = Service.all
    @client = Client.get(params[:client_id])
    @contract = Contract.new
    display @contract
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.get(params[:id])
    display @contract
  end

  # POST /clients/1/contracts
  # POST /clients/1/contracts.xml
  def create
    @contract = Contract.new(params[:contract])
    @contract.client_id = params[:client_id]

    if @contract.save
      # flash[:notice] = 'Contract was successfully created.'

      @client = @contract.client
      redirect resource(@client)
    else
      render :new
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.xml
  def update
    @contract = Contract.get(params[:id])

    if @contract.update_attributes(params[:contract])
      # flash[:notice] = 'Contract was successfully updated.'
      redirect resource(@contract)
    else
      render :edit
    end
  end

  def delete(id)
    @contract = Contract.get(id)
    display @contract
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.xml
  def destroy
    @client = Client.get(params[:client_id])
    @contract = Contract.get(params[:id])
    raise NotFound unless @contract
    if @contract.destroy
      #  flash[:notice] = 'Contract was successfully cancelled.'
      redirect resource(@client)
    else
      raise InternalServerError
    end
  end

  def init_menu
    @menu = ["Administration", "Clients"]
  end

end
