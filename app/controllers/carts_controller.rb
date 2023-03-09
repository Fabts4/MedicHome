class CartsController < ApplicationController
  def update
    @cart = Cart.find(params[:id])
  end

  private

  def cart_params
    params.require(:cart).permit(:prescription_id, :pharmacy_id, :status, :final_price)
  end
end
