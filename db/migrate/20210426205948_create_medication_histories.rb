class CreateMedicationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :medication_histories do |t|
      t.references :patient, foreign_key: true
      t.string :name, default: ""
     

      t.timestamps
    end
  end
end
