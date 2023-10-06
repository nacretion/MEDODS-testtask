class ConsultationRequestsController < ApplicationController
  def create
    result = ConsultationRequestContract.new.call(consultation_request_params)

    if result.success?
      @consultation_request = ConsultationRequest.new(result.to_h)
      if @consultation_request.save
        render json: @consultation_request, status: :created
      else
        render json: @consultation_request.errors, status: :unprocessable_entity
      end
    else
      render json: result.errors.to_h, status: :unprocessable_entity
    end
  end

  private

  def consultation_request_params
    params.require(:consultation_request).permit(:patient_id, :text, :date_of_creation)
  end
end