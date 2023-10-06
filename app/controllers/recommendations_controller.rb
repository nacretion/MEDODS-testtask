class RecommendationsController < ApplicationController
  before_action :set_consultation_request

  def index
    @patient = Patient.find(params[:patient_id])
    @recommendations = @patient.consultation_requests.joins(:recommendations).select('recommendations.id as id, recommendations.text as text, recommendations.created_at as created_at, recommendations.updated_at as updated_at').as_json
    render json: @recommendations
  end

  def create
    result = RecommendationContract.new.call(recommendation_params)

    if result.success?
      @recommendation = Recommendation.new(result.to_h)
      if @recommendation.save
        render json: @recommendation, status: :created
      else
        render json: @recommendation.errors, status: :unprocessable_entity
      end
    else
      render json: result.errors.to_h, status: :unprocessable_entity
    end
  end

  private

  def set_consultation_request
    if params[:consultation_request_id]
      @consultation_request = ConsultationRequest.find(params[:consultation_request_id])
    end
  end

  def recommendation_params
    params.require(:recommendation).permit(:text).merge(consultation_request_id: @consultation_request.id)
  end
end