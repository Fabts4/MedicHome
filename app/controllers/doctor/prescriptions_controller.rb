class Doctor::PrescriptionsController < ApplicationController
  def index
    @prescription = Prescription.new
    @prescriptions = Prescription.where(doctor: current_user)
  end

  def show
    @prescription = Prescription.find(params[:id])
    @prescription_items = PrescriptionItem.where(prescription_id: @prescription.id)
  end

  def edit
    @prescription = Prescription.find(params[:id])
    @prescription_items = PrescriptionItem.where(prescription_id: @prescription.id)
    @prescription_item = PrescriptionItem.new
    @items = Item.where(drug: true)
  end

  def update
    @prescription = Prescription.find(params[:id])
    @prescription.update(status: 1, date: Date.today)
    redirect_to doctor_prescriptions_path()
  end

  def create
    if prescription_params[:patient_id].empty?
      @prescription = Prescription.new
      @prescriptions = Prescription.where(doctor: current_user)
      render 'doctor/prescriptions/index', status: :unprocessable_entity
    else
      @prescription = Prescription.create(prescription_params.merge(doctor: current_user, date: Date.today))
      redirect_to edit_doctor_prescription_path(@prescription)
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:patient_id)
  end
end
