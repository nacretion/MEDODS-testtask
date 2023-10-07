class ConsultationRequestsController < ApplicationController

  def index
    # всякие проверки прав пользователя могли быть здесь (например, по auth токену запросить права пользователя из сервиса rights)
    render json: ConsultationRequest.all
  end

  def create
    @consultation_request = ConsultationRequest.new(consultation_request_params)

    if @consultation_request.save
      render json: @consultation_request, status: :created
    else
      render json: @consultation_request.errors, status: :unprocessable_entity
    end
  end

  private

  def consultation_request_params
    params.require(:consultation_request).permit(:patient_id, :text)
  end
end

require_relative '../services/open_fda_api'