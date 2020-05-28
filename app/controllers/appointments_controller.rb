class AppointmentsController < ApplicationController
    def new
        @doctors = Doctor.all
        @appointment = Appointment.new(patient)
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @appointment.save
    end

    private

    def appointment_params
        params.require(:appointment).permit(:apppintment_time, :doctor_id, :patient_id)
    end
end