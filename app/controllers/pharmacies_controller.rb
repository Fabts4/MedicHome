class PharmaciesController < ApplicationController
  before_action :set_prescription

  def index
    @pharmacies = Pharmacy.all
    @markers = @pharmacies.geocoded.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        lng: pharmacy.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { pharmacy: pharmacy}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
    @cart = Cart.find_or_create_by(pharmacy_id: @pharmacy.id, prescription_id: @prescription.id)
    @drugs = @prescription.prescription_items
    @parapharma = Item.where(drug: false)
    @cart_items = @cart.cart_items
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:prescription_id])
  end
end
