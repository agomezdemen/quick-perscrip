class PatientsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :home, :login]

  def index
    @patients = Patient.all
  end

  def home
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
      redirect_to patients_login_path
    else
      redirect_to new_patient_path
    end
  end

  def destroy
    @patient = Patient.where(id: params[:id]).first
    @patient.destroy
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :password)
  end
end
