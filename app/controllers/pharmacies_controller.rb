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
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:prescription_id])
  end
end
