class RemoveDateOfCreationFromConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    remove_column :consultation_requests, :date_of_creation, :datetime
  end
end
