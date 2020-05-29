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

  def login
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.valid?
      @doctor.save
      session[:doctor_id] = @doctor.id
      redirect_to @doctor
    else
      redirect_to new_doctor_path
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :email, :password, :license_id)
  end
end
