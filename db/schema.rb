# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_18_191431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "city", default: "", null: false
    t.string "country", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "allergies", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_allergies_on_patient_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.date "appointment_date", null: false
    t.integer "appointment_time", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_diseases_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.date "date_of_birth", default: -> { "CURRENT_DATE" }, null: false
    t.integer "gender", default: 0, null: false
    t.string "street", default: "", null: false
    t.string "building", default: "", null: false
    t.string "city", default: "", null: false
    t.string "state", default: ""
    t.string "zip_code", default: "", null: false
    t.string "country", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.integer "marital_status", default: 0, null: false
    t.string "emergency_first_name", default: ""
    t.string "emergency_last_name", default: ""
    t.string "emergency_phone_number", default: ""
    t.integer "years_of_experience", default: 0, null: false
    t.string "specialities", default: "", null: false
    t.string "latest_acdemic_achievment", default: ""
    t.string "clinic_street", default: "", null: false
    t.string "clinic_building", default: "", null: false
    t.string "clinic_city", default: "", null: false
    t.string "clinic_state", default: "", null: false
    t.string "clinic_zip_code", default: "", null: false
    t.string "clinic_country", default: "", null: false
    t.integer "clinic_working_hours_from", default: 0, null: false
    t.integer "clinic_working_hours_to", default: 0, null: false
    t.string "clinic_working_days", default: "", null: false
    t.string "clinic_phone_number", default: "", null: false
    t.integer "rating", default: 5
    t.string "verified", default: "not verified"
    t.string "banned", default: "not banned"
    t.integer "reports_number", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "medication_histories", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_medication_histories_on_patient_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.integer "times", default: 0, null: false
    t.date "start_date", default: -> { "CURRENT_DATE" }, null: false
    t.integer "duration", default: 0, null: false
    t.string "dosage", default: "", null: false
    t.boolean "done", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_medications_on_doctor_id"
    t.index ["patient_id"], name: "index_medications_on_patient_id"
  end

  create_table "operations", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "operation_name"
    t.date "operation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_operations_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.date "date_of_birth", default: -> { "CURRENT_DATE" }, null: false
    t.integer "gender", default: 0, null: false
    t.string "street", default: "", null: false
    t.string "building", default: "", null: false
    t.string "city", default: "", null: false
    t.string "state", default: ""
    t.string "zip_code", default: "", null: false
    t.string "country", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.integer "marital_status", default: 0, null: false
    t.string "emergency_first_name", default: ""
    t.string "emergency_last_name", default: ""
    t.string "emergency_phone_number", default: ""
    t.integer "height"
    t.decimal "weight", precision: 5, scale: 2, default: "0.0"
    t.string "blood_type", default: ""
    t.string "family_allergies", default: ""
    t.string "family_diseaeses", default: ""
    t.string "family_other_illnesses", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "reminders", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "medication_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medication_id"], name: "index_reminders_on_medication_id"
    t.index ["patient_id"], name: "index_reminders_on_patient_id"
  end

  create_table "special_habits", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "special_habit", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_special_habits_on_patient_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.string "name", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_tests_on_doctor_id"
    t.index ["patient_id"], name: "index_tests_on_patient_id"
  end

  add_foreign_key "allergies", "patients"
  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "diseases", "patients"
  add_foreign_key "medication_histories", "patients"
  add_foreign_key "medications", "doctors"
  add_foreign_key "medications", "patients"
  add_foreign_key "operations", "patients"
  add_foreign_key "reminders", "medications"
  add_foreign_key "reminders", "patients"
  add_foreign_key "special_habits", "patients"
  add_foreign_key "tests", "doctors"
  add_foreign_key "tests", "patients"
end
