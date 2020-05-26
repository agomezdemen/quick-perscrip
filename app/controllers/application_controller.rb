class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_patient
    helper_method :logged_in?

    def current_patient    
        Patient.find_by(id: session[:patient_id])  
    end

    def logged_in?
        !current_patient.nil?  
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
     end
end
