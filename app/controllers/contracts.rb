module Locomotive
  class Contracts < Locomotive::Application

    before :init_menu

    # GET /contracts
    # GET /contracts.xml
    def index
      @contracts = Locomotive::Contract.all
      display @contracts
    end

    # GET /contracts/1
    # GET /contracts/1.xml
    def show
      @contract = Locomotive::Contract.get(params[:id])
      display @contract
    end

    # GET /clients/1/contracts/assign/2
    def new
      @services = Locomotive::Service.all
      @client = Locomotive::Client.get(params[:client_id])
      @contract = Locomotive::Contract.new
      display @contract
    end

    # GET /contracts/1/edit
    def edit
      @contract = Locomotive::Contract.get(params[:id])
      display @contract
    end

    # POST /clients/1/contracts
    # POST /clients/1/contracts.xml
    def create
      @contract = Locomotive::Contract.new(params[:contract])
      @contract.client_id = params[:client_id]

      if @contract.save
        # flash[:notice] = 'Locomotive::Contract was successfully created.'

        @client = @contract.client
        redirect resource(@client)
      else
        render :new
      end
    end

    # PUT /contracts/1
    # PUT /contracts/1.xml
    def update
      @contract = Locomotive::Contract.get(params[:id])

      if @contract.update_attributes(params[:contract])
        # flash[:notice] = 'Locomotive::Contract was successfully updated.'
        redirect resource(@contract)
      else
        render :edit
      end
    end

    def delete(id)
      @contract = Locomotive::Contract.get(id)
      display @contract
    end

    # DELETE /contracts/1
    # DELETE /contracts/1.xml
    def destroy
      @client = Locomotive::Client.get(params[:client_id])
      @contract = Locomotive::Contract.get(params[:id])
      raise NotFound unless @contract
      if @contract.destroy
        #  flash[:notice] = 'Locomotive::Contract was successfully cancelled.'
        redirect resource(@client)
      else
        raise InternalServerError
      end
    end

    def init_menu
      @menu = ["Administration", "Clients"]
    end

  end
end
