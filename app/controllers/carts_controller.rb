class CartsController < ApplicationController
  def update
    @cart = Cart.find(params[:id])
    @cart.ordered!
    @cart.final_price = params[:price]
    @cart.pharmacy.id = params[:pharmacy]
    @prescription = @cart.prescription
    @prescription.ordered!
    redirect_to patient_prescriptions_path
  end
end
