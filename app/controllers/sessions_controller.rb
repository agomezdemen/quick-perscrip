class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @patient = Patient.find_by(email: params[:email])
    if @patient && @patient.authenticate(params[:password])
       sessions[:patient_id] = @patient.id
       redirect_to '/welcome'
    else
       redirect_to '/login'
    end
  end

  def page_requires_login
  end

  def login
  end

  def welcome
  end
end
