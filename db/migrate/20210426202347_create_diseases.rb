class CreateDiseases < ActiveRecord::Migration[6.1]
  def change
    create_table :diseases do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :name, default: ""

      t.timestamps
    end
  end
end
