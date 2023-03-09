class PharmaciesController < ApplicationController
  before_action :set_prescription

  def index
    @pharmacies = Pharmacy.all
    @markers = @pharmacies.geocoded.map do |pharmacy|
      {
        lat: pharmacy.latitude,
        lng: pharmacy.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { pharmacy: pharmacy})
      }
    end
    # @users = User.all
    # @markers = @users.geocoded.map do |user|
    #   {
    #     lat: current_user.latitude,
    #     lng: current_user.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: { user: current_user })
    #   }
    # end
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
