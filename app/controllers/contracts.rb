module Locomotive
  class Contracts < Locomotive::Application

    before :init_menu

    # GET /contracts
    # GET /contracts.xml
    def index
      @page_count, @contracts = Locomotive::Contract.paginated(:page => (params[:page] || 1).to_i)
      display @contracts
    end

    # GET /contracts/1
    # GET /contracts/1.xml
    def show(id)
      @contract = Locomotive::Contract.get(id)
      raise NotFound unless @contract
      display @contract
    end

    # GET /clients/1/contracts/assign/2
    def new
      only_provides :html
      @services = Locomotive::Service.all
      @client = Locomotive::Client.get(params[:client_id])
      @contract = Locomotive::Contract.new
      display @contract
    end

    # GET /contracts/1/edit
    def edit(id)
      only_provides :html
      @contract = Locomotive::Contract.get(id)
      raise NotFound unless @contract
      display @contract
    end

    # POST /clients/1/contracts
    # POST /clients/1/contracts.xml
    def create(contract)
      @contract = Locomotive::Contract.new(contract)
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
    def update(id, contract)
      @contract = Locomotive::Contract.get(id)
      raise NotFound unless @contract
      if @contract.update_attributes(contract)
        # flash[:notice] = 'Locomotive::Contract was successfully updated.'
        redirect resource(@contract)
      else
        render :edit
      end
    end

    def delete(id)
      @contract = Locomotive::Contract.get(id)
      raise NotFound unless @contract
      display @contract
    end

    # DELETE /contracts/1
    # DELETE /contracts/1.xml
    def destroy(id)
      @client = Locomotive::Client.get(params[:client_id])
      @contract = Locomotive::Contract.get(id)
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
