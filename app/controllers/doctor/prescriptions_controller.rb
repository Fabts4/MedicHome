class Doctor::PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.where(doctor: current_user)
  end

  def show
    @prescription = Prescription.where(doctor: current_user, id: params[:id])
  end

  def edit
  end

  def update
  end
end
