class PatientContract < Dry::Validation::Contract
  params do
    required(:full_name).filled(:string)
    required(:date_of_birth).filled(:date)
    required(:phone_number).filled(:string)
    required(:email).filled(:string)
  end
end