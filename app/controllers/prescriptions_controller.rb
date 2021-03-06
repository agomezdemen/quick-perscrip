class PrescriptionsController < ApplicationController
    def new
        @doctors = Doctor.all 
        @patients = Patient.all
        @drugs = Drug.all
        @prescription = Prescription.new
    end

    def create
        @prescription = Prescription.new(prescription_params)
        @prescription.doctor = @doctor
        @prescription.save
    end

    def show
        @prescription = Prescription.find(params[:id])
    end

    private

    def prescription_params
        params.require(:prescription).permit(:doctor_name, :patient_name, :dosage, :doctor_id, :patient_id, :drug_id)
    end
end