class BasketsController < ApplicationController
  def create
  # Dans pharmacies controller
  end

  def update
    @basket = Basket.find(params[:id])
  end
end

private

def basket_params
  params.require(:basket).permit(:prescription_id, :pharmacy_id, :status, :final_price)
end
