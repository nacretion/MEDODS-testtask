class PatientsController < ApplicationController
  def create
    result = PatientContract.new.call(patient_params)

    if result.success?
      @patient = Patient.new(result.to_h)
      if @patient.save
        render json: @patient, status: :created
      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    else
      render json: result.errors.to_h, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:full_name, :date_of_birth, :phone_number, :email)
  end
end