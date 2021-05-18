class CreateMedicationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :medication_histories do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :name, default: ""
      t.string :special_habits, default: ""

      t.timestamps
    end
  end
end
