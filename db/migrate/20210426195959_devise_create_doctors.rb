# frozen_string_literal: true

class DeviseCreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :username, null: false, default: ""
      t.string :first_name ,              null: false, default: ""
      t.string :last_name ,              null: false, default: ""
      t.date :date_of_birth ,              null: false, default:-> {'CURRENT_DATE'}
      t.integer :gender ,            null: false, default: 0
      t.string :street ,            null: false, default: ""
      t.string :building ,            null: false, default: ""
      t.string :city ,            null: false, default: ""
      t.string :state ,             default: ""
      t.string :zip_code ,            null: false, default: ""
      t.string :country ,            null: false, default: ""
      t.string :phone_number ,            null: false, default: ""
      t.integer :marital_status ,            null: false, default: 0
      t.string :emergency_first_name ,             default: ""
      t.string :emergency_last_name ,            default: ""
      t.string :emergency_phone_number ,            default: ""
      t.integer :years_of_experience ,            null: false, default: 0
      t.string :specialities ,            null: false, default: ""
      t.string :latest_acdemic_achievment , default: ""
      t.string :clinic_street ,            null: false, default: ""
      t.string :clinic_building ,            null: false, default: ""
      t.string :clinic_city ,            null: false, default: ""
      t.string :clinic_state ,            null: false, default: ""
      t.string :clinic_zip_code,            null: false, default: ""
      t.string :clinic_country,            null: false, default: ""
      t.integer :clinic_working_hours_from,            null: false, default: 0
      t.integer :clinic_working_hours_to ,            null: false, default: 0
      t.string :clinic_working_days ,            null: false, default: ""
      t.string :clinic_phone_number ,            null: false, default: ""
      t.integer :rating ,            null: false, default: 0

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :doctors, :email,                unique: true
    add_index :doctors, :reset_password_token, unique: true
    # add_index :doctors, :confirmation_token,   unique: true
    # add_index :doctors, :unlock_token,         unique: true
  end
end
