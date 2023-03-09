class OrdersController < ApplicationController
  def create
    @order = Order.create!(order_params)
  end

  def update
  end

  def destroy
  end


  private

  def order_params
    params.require(:order).permit(:basket_id, :item_id, :quantity)
  end
end
