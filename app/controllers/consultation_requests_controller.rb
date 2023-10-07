class ConsultationRequestsController < ApplicationController
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
    params.require(:consultation_request).permit(:patient_id, :text, :date_of_creation)
  end
end
require_relative '../services/open_fda_api'