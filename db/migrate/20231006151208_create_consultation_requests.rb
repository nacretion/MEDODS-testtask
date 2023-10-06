class CreateConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :consultation_requests do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :text
      t.datetime :date_of_creation

      t.timestamps
    end
  end
end
