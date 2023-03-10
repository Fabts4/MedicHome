class Patient::PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.where(patient: current_user)
  end

  def show
    @prescription = Prescription.find(params[:id])
    @prescription_items = PrescriptionItem.where(prescription_id: @prescription.id)
  end
end
