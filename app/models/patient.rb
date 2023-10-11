class Patient < ApplicationRecord
  has_many :consultation_requests

  def self.get_by_recommendation(recommendation_id)
    joins(consultation_requests: :recomendations)
      .where('recomendations.id = ?', recommendation_id)
      .select('patients.*')
      .distinct
      .first
  end

  validates :date_of_birth, presence: true
  validates :phone_number, presence: true

  validate :date_of_birth_in_past
  validate :valid_phone_number

  def valid_phone_number
    return if phone_number.blank?
    unless Phonelib.valid?(phone_number)
      errors.add(:phone_number, 'is invalid')
    end
  end

  def date_of_birth_in_past
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "must be a date in the past")
    end
  end

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true
end
