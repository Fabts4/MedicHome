class PharmaciesController < ApplicationController
  before_action :set_prescription

  def index
    @pharmacies = Pharmacy.all
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
    @basket = Basket.find_or_create_by(pharmacy_id: @pharmacy.id, prescription_id: @prescription.id)
    @item = Item.all
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:prescription_id])
  end
end
