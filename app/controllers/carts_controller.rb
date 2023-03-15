class CartsController < ApplicationController
  def update
    @cart = Cart.find(params[:id])
    @cart.ordered!
    @cart.final_price = params[:price]
    @cart.pharmacy.id = params[:pharmacy]
    @cart.save
    @prescription = @cart.prescription
    @prescription.ordered!
    redirect_to  patient_prescription_path(@prescription)
  end
end
