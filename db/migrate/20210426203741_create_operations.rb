class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :operation_name
      t.date :operation_date 

      t.timestamps
    end
  end
end
