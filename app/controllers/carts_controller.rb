class CartsController < ApplicationController
  def create
    # @pharmacy = Pharmacy.find(params[:pharmacy_id])
    # # @prescription = Prescription.find(params[:prescription_id])
    # @cart = Cart.new(cart_params)
    # if @cart.save
    #   redirect_to @pharmacy
    # else
    #   render :new # surement pas new, à MAJ
    # end
  end

  def update
  end
end

# private

# def cart_params
#   params.require(:cart).permit(:prescription_id, :pharmacy_id, :status, :final_price)
# end
