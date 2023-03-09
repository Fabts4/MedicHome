class Patient::PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.where(patient: current_user)
  end

  def show
    @prescription = Prescription.where(patient: current_user, id: params[:id])
  end
end
