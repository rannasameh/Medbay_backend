class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :medication, null: false, foreign_key: true
      
      t.integer :status,  null: false, default: 0

      t.timestamps
    end
  end
end
