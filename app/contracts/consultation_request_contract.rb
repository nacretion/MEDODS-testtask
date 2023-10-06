class ConsultationRequestContract < Dry::Validation::Contract
  params do
    required(:patient_id).filled(:integer)
    required(:text).filled(:string)
    required(:date_of_creation).filled(:date)
  end
end
