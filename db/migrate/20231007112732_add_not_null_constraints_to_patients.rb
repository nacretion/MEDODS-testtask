class AddNotNullConstraintsToPatients < ActiveRecord::Migration[7.1]
  def change
    change_column :patients, :full_name, :string, null: false
    change_column :patients, :date_of_birth, :date, null: false
    change_column :patients, :phone_number, :string, null: false
    change_column :patients, :email, :string, null: false
  end
end
