class Doctor::PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.where(doctor: current_user)
  end

  def show
  end

  def edit
  end

  def update
  end
end
