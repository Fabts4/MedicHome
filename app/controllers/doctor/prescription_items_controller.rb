class Doctor::PrescriptionItemsController < ApplicationController
  def create
    @prescription = Prescription.find(params[:prescription_id])
    @prescription_item = PrescriptionItem.new(item_params)
    @prescription_item.prescription = @prescription
    if @prescription_item.save
      redirect_to edit_doctor_prescription_path(@prescription)
    else
      render 'edit_doctor_prescription', status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:prescription_item).permit(:item_id, :posology)
  end

end
