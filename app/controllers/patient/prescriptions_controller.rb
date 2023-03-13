class Patient::PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.where(patient: current_user)
    @ordered_prescriptions = Prescription.ordered
    @sent_prescriptions = Prescription.sent
    @draft_prescriptions = Prescription.draft
  end

  def show
    @prescription = Prescription.find(params[:id])
    @prescription_items = PrescriptionItem.where(prescription_id: @prescription.id)
  end
end
