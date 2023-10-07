class PatientMailer < ApplicationMailer
  def recommendation_notification(patient, recommendation)
    @patient = patient
    @recommendation = recommendation
    mail(to: @patient.email, subject: 'Новая рекомендация')
  end
end