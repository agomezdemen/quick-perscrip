class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        if session[:patient_id]
            @patient = Patient.find(session[:patient_id])
        elsif session[:doctor_id]
            @doctor = Doctor.find(session[:doctor_id])
        end
    end

    def logged_in?
        !!current_user 
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end
end
