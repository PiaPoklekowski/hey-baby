class CreatePregnancies < ActiveRecord::Migration[7.0]
  def change
    create_table :pregnancies do |t|
      t.date :due_date
      t.string :baby_nickname
      t.integer :pregnancy_week
      t.string :gender

      t.timestamps
    end
  end
end
