class Doctor::PrescriptionsController < ApplicationController
  def index
    @prescription = Prescription.new
  end

  def show
  end

  def edit
    @prescription = Prescription.find(params[:id])
    @prescription_items = PrescriptionItem.where(prescription_id: @prescription.id)
    @prescription_item = PrescriptionItem.new
    @items = Item.where(drug: true)
  end

  def update
  end

  def create
    if prescription_params[:patient_id].empty?
      @prescription = Prescription.new
      render 'doctor/prescriptions/index', status: :unprocessable_entity
    else
      @prescription = Prescription.find_or_create_by(prescription_params.merge(doctor: current_user))
      redirect_to edit_doctor_prescription_path(@prescription)
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:patient_id)
  end
end
