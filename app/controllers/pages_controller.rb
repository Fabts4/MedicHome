class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: []
  def home
    @prescription = Prescription.new
  end

  def doctor_home
    @prescription = Prescription.new
  end

  def patient_home
  end

end
