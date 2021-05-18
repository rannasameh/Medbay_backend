class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.string :name, null: false, default: ""
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.integer :times , null: false, default: 0
      t.date :start_date ,   null: false, default:-> {'CURRENT_DATE'}
      t.date :end_date , null: false, default:-> {'CURRENT_DATE'}
      t.string :dosage , null: false, default: ""
      

      t.timestamps
    end
  end
end
