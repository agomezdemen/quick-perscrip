class DoctorsController < ApplicationController

  def home
    render '/doctors/home'
  end

  def new
    @doctor = Doctor.new
  end

  def show
    @patients = Patient.all
    @doctor = Doctor.find(params[:id])
  end

  def create
  end

  private

  def patient_params
    params.require(:doctor).permit(:name, :email, :password, :licnese_id)
  end
end
