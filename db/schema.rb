ActiveRecord::Schema[7.1].define(version: 2023_10_07_112732) do
  enable_extension "plpgsql"

  create_table "consultation_requests", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_consultation_requests_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "full_name", null: false
    t.date "date_of_birth", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recomendations", force: :cascade do |t|
    t.bigint "consultation_request_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultation_request_id"], name: "index_recomendations_on_consultation_request_id"
  end

  add_foreign_key "consultation_requests", "patients"
  add_foreign_key "recomendations", "consultation_requests"
end
