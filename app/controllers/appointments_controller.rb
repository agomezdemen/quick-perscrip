class AppointmentsController < ApplicationController
    before_action :get_patient, only: [:create, :new]

    def new
        @doctors = Doctor.all
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @appointment.patient = @patient
        @appointment.save
    end

    def destroy
        @appointment = Appointment.where(id: params[:id]).first
        @appointment.destroy
    end

    private

    def get_patient
        @patient = Patient.find(session[:patient_id])
    end

    def appointment_params
        params.require(:appointment).permit(:appointment_time, :doctor_id, :patient_id)
    end
end