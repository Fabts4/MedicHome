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
    @cart = Cart.find_by(prescription_id: @prescription.id)
    if !@cart.nil?
      @paraitems = @cart.cart_items
    end
  end
end
