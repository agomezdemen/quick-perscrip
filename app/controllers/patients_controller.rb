class PatientsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    session[:patient_id] = @patient.id
    redirect_to '/welcome'
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :password)
  end
end
