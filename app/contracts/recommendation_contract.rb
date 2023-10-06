class RecommendationContract < Dry::Validation::Contract
  params do
    required(:text).filled(:string)
  end
end