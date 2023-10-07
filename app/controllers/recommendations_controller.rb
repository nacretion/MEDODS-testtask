class RecommendationsController < ApplicationController
  before_action :set_consultation_request

  def index
    if params[:patient_id]
      render json: Recomendation.get_by_patient_id(params[:patient_id])
    else
      # всякие проверки прав пользователя могли быть здесь (например, по auth токену запросить права пользователя из сервиса rights)
      render json: Recomendation.all
    end

  end

  def create
    @recommendation = Recomendation.new(recommendation_params)

    if !recommendation_errors && @recommendation.save
      @patient = Patient.get_by_recommendation(@recommendation.id)
      render json: @recommendation, status: :created

      PatientMailer.recommendation_notification(@patient, @recommendation).deliver_now
    else
      render json: { errors: 'Некорректные данные. ' + recommendation_errors }, status: :unprocessable_entity
    end
  end

  private

  def set_consultation_request
    if params[:consultation_request_id]
      @consultation_request = ConsultationRequest.find(params[:consultation_request_id])
    end
  end

  def recommendation_params
    params[:recommendation].permit(:text).merge(consultation_request_id: @consultation_request.id)
  end

  def recommendation_errors
    if @recommendation.text.blank? || @recommendation.consultation_request_id.blank?
      "Не передан какой-либо из параметров"
    else
      nil
    end
  end
end