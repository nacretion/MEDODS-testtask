class PatientsController < ApplicationController
  def index
    # всякие проверки прав пользователя могли быть здесь (например, по auth токену запросить права пользователя из сервиса rights)
    render json: Patient.all
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      render json: @patient, status: :created
    else
      render json: { errors: @patient.errors }, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params[:patient].permit(:full_name, :date_of_birth, :phone_number, :email)
  end
end