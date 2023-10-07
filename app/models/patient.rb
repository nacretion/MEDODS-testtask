class Patient < ApplicationRecord
  has_many :consultation_requests

  def self.get_by_recommendation(recommendation_id)
    joins(consultation_requests: :recomendations)
      .where('recomendations.id = ?', recommendation_id)
      .select('patients.*')
      .distinct
      .first
  end
end
