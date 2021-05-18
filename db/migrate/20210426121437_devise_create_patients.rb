# frozen_string_literal: true

class DeviseCreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :username, null: false, default: ""
      t.string :first_name , null: false, default: ""
      t.string :last_name   , null: false, default: ""
      t.date :date_of_birth  , null: false, default: -> {'CURRENT_DATE'}
      t.integer :gender  , null: false, default: 0
      t.string :street   , null: false, default: ""
      t.string :building  , null: false, default: ""
      t.string :city  , null: false, default: ""
      t.string :state  , default: ""
      t.string :zip_code  , null: false, default: ""
      t.string :country    , null: false, default: ""
      t.string :phone_number  , null: false, default: ""
      t.integer :marital_status  , null: false, default: 0
      t.string :emergency_first_name  , default: ""
      t.string :emergency_last_name , default: ""
      t.string :emergency_phone_number  , default: ""
      t.integer :height  , default: ""
      t.decimal :weight  ,precision:5,scale:2 , default: 0
      t.integer :blood_type  
      t.string :family_allergies ,  default: ""
      t.string :family_diseaeses , default: ""
      t.string :family_other_illnesses , default: ""
    

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

    add_index :patients, :email,                unique: true
    add_index :patients, :reset_password_token, unique: true
    # add_index :patients, :confirmation_token,   unique: true
    # add_index :patients, :unlock_token,         unique: true
  end
end
