class Doctor::PrescriptionItemsController < ApplicationController
  def create
    @prescription = Prescription.find(params[:prescription_id])
    @prescription_item = PrescriptionItem.new(item_params_create)
    @prescription_item.prescription = @prescription
    posology = "A prendre #{item_params_posology[:quantity1]} fois par #{item_params_posology[:frequency1]} pendant #{item_params_posology[:quantity2]} #{item_params_posology[:frequency2]}"
    @prescription_item.posology = posology
    if @prescription_item.save
      redirect_to edit_doctor_prescription_path(@prescription)
    else
      redirect_to edit_doctor_prescription_path(@prescription), status: :unprocessable_entity
    end
  end

  def update
    @prescription_item = PrescriptionItem.find(params[:id])
    @prescription_item.update(item_params_update)
    redirect_to edit_doctor_prescription_path
  end

  def destroy
    @prescription_item = PrescriptionItem.find(params[:id])
    @prescription = @prescription_item.prescription
    @prescription_item.destroy
    redirect_to edit_doctor_prescription_path(@prescription)
  end

  private

  def item_params_create
    params.require(:presc).permit(:item_id)
  end

  def item_params_posology
    params.require(:presc).permit(:quantity1, :quantity2, :frequency1, :frequency2)
  end

  def item_params_update
    params.require(:prescription_item).permit(:item_id, :posology)
  end

end
