class PatientsController < ApplicationController
  def index
    # всякие проверки прав пользователя могли быть здесь (например, по auth токену запросить права пользователя из сервиса rights)
    render json: Patient.all
  end

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
    params[:patient].permit(:full_name, :date_of_birth, :phone_number, :email)
  end

  def patient_errors
    if @patient.full_name.blank? || @patient.date_of_birth.blank? || @patient.phone_number.blank? || @patient.email.blank?
      "Не передан какой-либо из параметров"
    elsif Patient.exists?(phone_number: @patient.phone_number, email: @patient.email)
      "Номер или email уже существует"
    else
      nil
    end
  end
end