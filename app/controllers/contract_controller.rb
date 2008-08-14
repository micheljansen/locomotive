class ContractController < ApplicationController
  def destroy
      @contract = Contract.find(params[:id])
      @contract.destroy
  end
end
