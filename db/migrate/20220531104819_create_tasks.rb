class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.boolean :completed
      t.string :assigned_to, default: "mother"
      t.date :start_time
      t.date :deadline
      t.string :form_url_de
      t.string :form_url_en
      t.references :category, null: false, foreign_key: true
      t.references :pregnancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
