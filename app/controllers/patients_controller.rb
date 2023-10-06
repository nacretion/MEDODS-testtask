class PatientsController < ApplicationController
  def create
    @patient = Patient.new(patient_params)

    if !patient_errors && @patient.save
      render json: @patient, status: :created
    else
      render json: { errors: 'Некорректные данные. ' + patient_errors }, status: :unprocessable_entity
    end
  end

  private


  def patient_params
    params.require(:patient).permit(:full_name, :date_of_birth, :phone_number, :email)
  end

  def patient_errors
    if Patient.exists?(phone_number: @patient.phone_number, email: @patient.email)
      "Номер или email уже существует"
    elsif @patient.full_name.blank? || @patient.date_of_birth.blank? || @patient.phone_number.blank? || @patient.email.blank?
      "Не передан какой-либо из параметров"
    else
      ""
    end
  end
end
