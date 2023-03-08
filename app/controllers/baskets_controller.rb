class BasketsController < ApplicationController
  def create
    # @pharmacy = Pharmacy.find(params[:pharmacy_id])
    # # @prescription = Prescription.find(params[:prescription_id])
    # @basket = Basket.new(basket_params)
    # if @basket.save
    #   redirect_to @pharmacy
    # else
    #   render :new # surement pas new, à MAJ
    # end
  end

  def update
  end
end

# private

# def basket_params
#   params.require(:basket).permit(:prescription_id, :pharmacy_id, :status, :final_price)
# end
