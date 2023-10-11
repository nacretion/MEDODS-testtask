FactoryBot.define do
  factory :patient do
    full_name { "John Doe" }
    date_of_birth { "2000-01-01" }
    phone_number { "+79088556666" }
    email { "john@example.com" }
  end
end