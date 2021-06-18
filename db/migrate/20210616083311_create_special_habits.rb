class CreateSpecialHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :special_habits do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :special_habit , default: ""
      t.timestamps
    end
  end
end
