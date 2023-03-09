class CartsController < ApplicationController
  def update
    raise
    @cart = Cart.find(params[:id])
    if @cart.update(:status, :final_price)
      redirect_to prescription_pharmacy_path(@cart.pharmacy)
    else
      redirect_to prescription_pharmacy_path(@cart.pharmacy), status: :unprocessable_entity
    end
  end
end
