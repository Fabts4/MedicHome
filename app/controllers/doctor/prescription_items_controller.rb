class Doctor::PrescriptionItemsController < ApplicationController
  def create
    @prescription = Prescription.find(params[:prescription_id])
    @prescription_item = PrescriptionItem.new(item_params)
    @prescription_item.prescription = @prescription
    if @prescription_item.save
      redirect_to edit_doctor_prescription_path(@prescription)
    else
      redirect_to edit_doctor_prescription_path(@prescription), status: :unprocessable_entity
    end
  end

  def update
    @prescription_item = PrescriptionItem.find(params[:id])
    @prescription_item.update(item_params)
    redirect_to edit_doctor_prescription_path
  end

  def destroy
    @prescription_item = PrescriptionItem.find(params[:id])
    @prescription = @prescription_item.prescription
    @prescription_item.destroy
    redirect_to edit_doctor_prescription_path(@prescription)
  end

  private

  def item_params
    params.require(:prescription_item).permit(:item_id, :posology)
  end

end
