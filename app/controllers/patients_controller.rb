class PatientsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def index
    @patients = Patient.all
  end

  def home
    render '/patients/home'
  end
  
  def new
    @patient = Patient.new
  end

  def show
    @doctors = Doctor.all
    @patient = Patient.find(params[:id])
  end

  def login
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.valid?
      @patient.save
      session[:patient_id] = @patient.id
      redirect_to @patient
    else
      redirect_to new_patient_path
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :password)
  end
end
