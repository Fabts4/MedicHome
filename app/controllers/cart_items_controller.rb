class OrdersController < ApplicationController
  def create
    @order = Order.create!(order_params)
    redirect_to prescription_pharmacy_path(@order.prescription, @order.pharmacy)
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      render :new
    else
      redirect_to prescription_pharmacy_path(@order.prescription, @order.pharmacy), status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to prescription_pharmacy_path(@order.prescription, @order.pharmacy)
  end

  private

  def order_params
    params.permit(:basket_id, :item_id, :quantity) #quantity risque d'etre nesté pour order (faire le require)
  end
end
