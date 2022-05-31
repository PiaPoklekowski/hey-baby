class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :pregnancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
