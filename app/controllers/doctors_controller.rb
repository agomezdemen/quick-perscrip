class DoctorsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :home, :login]

  def home
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
    license = License.find_by(number: params[:doctor][:license_id].to_i)
    @doctor.license_id = license.id
    if @doctor.valid?
      @doctor.save
      session[:doctor_id] = @doctor.id
      redirect_to doctors_login_path
    else
      redirect_to new_doctor_path
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :email, :password)
  end
end
