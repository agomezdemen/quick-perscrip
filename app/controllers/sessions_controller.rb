class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @patient = Patient.find_by(email: params[:email])
    if @patient && @patient.authenticate(params[:password])
       session[:patient_id] = @patient.id
       redirect_to 'patients/home'
    else
       redirect_to 'patients/login'
    end
  end

  def page_requires_login
  end

  def login
  end

  def welcome
  end
end

#need to make user super class and have patients and doctors inherit
# <% if logged_in? %>
#     <h1>You are Logged In, <%= current_patient.name %></h1>
# <%end%>
# <%= button_to "Login", '/login', method: :get%>
# <%= button_to "Sign Up", '/patients/new', method: :get%>