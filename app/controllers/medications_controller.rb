class MedicationsController < ApplicationController
  def search_drug
    query = params[:query]
    @results = OpenFDAApi.search_drugs(query)
    render json: @results
  end

  def search_by_reactionmeddrapt
    query = params[:query]
    @results = OpenFDAApi.search_drugs_by_reactionmeddrapt(query)
    render json: @results
  end
end