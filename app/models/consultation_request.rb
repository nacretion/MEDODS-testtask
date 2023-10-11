class ConsultationRequest < ApplicationRecord
  belongs_to :patient
  has_many :recomendations

  validates :text, presence: true
  validates :patient_id, presence: true
end
