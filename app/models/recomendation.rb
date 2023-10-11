class Recomendation < ApplicationRecord
  belongs_to :consultation_request

  def self.get_by_patient_id(patient_id)
    @patient = Patient.find(patient_id)
    @patient.consultation_requests.joins(:recomendations).select('recomendations.id as id, recomendations.text as text, recomendations.created_at as created_at, recomendations.updated_at as updated_at').as_json
  end

  validates :text, presence: true
  validates :consultation_request_id, presence: true
end
