class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.date :appointment_date , null: false, default: ""
      t.integer :appointment_time , null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
