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

    if @recommendation.save
      render json: @recommendation, status: :created

      # Раскомментировать, если указан SMTP сервер. На medods.nacretion.space он указан, можно тестить через него
      # @patient = Patient.get_by_recommendation(@recommendation.id)
      # PatientMailer.recommendation_notification(@patient, @recommendation).deliver_now
    else
      render json: { errors: @recommendation.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_consultation_request
    if params[:consultation_request_id]
      @consultation_request = ConsultationRequest.find_by(id: params[:consultation_request_id])

      unless @consultation_request
        render json: { errors: 'Запрос на консультацию не найден' }, status: :unprocessable_entity
      end
    end
  end

  def recommendation_params
    params[:recommendation].permit(:text).merge(consultation_request_id: @consultation_request.id)
  end
end