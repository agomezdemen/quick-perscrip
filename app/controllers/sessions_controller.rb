class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    if params[:patient]
      @patient = Patient.find_by(email: params[:email])
      if @patient && @patient.authenticate(params[:password])
        session[:patient_id] = @patient.id
        redirect_to @patient
      else
        render 'patients/login'
      end
    elsif params[:doctor]
      @doctor = Doctor.find_by(email: params[:email])
      if @doctor && @doctor.authenticate(params[:password])
        session[:doctor_id] = @doctor.id
        redirect_to @doctor
      else
        render 'doctors/login'
      end
    end
  end

  def destroy
    if session[:patient_id]
      session.delete :patient
      redirect_to patients_home_path
    elsif session[:doctor_id]
      session.delete :doctor
      redirect_to doctors_home_path
    end
  end

  def page_requires_login
  end

  def login
  end

  def welcome
  end
end