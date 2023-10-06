class CreateRecomendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recomendations do |t|
      t.references :consultation_request, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
