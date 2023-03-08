class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: []
  def home
  end
  def doctor_home
  end
  def patient_home
  end

end
