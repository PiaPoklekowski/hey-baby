class CreateImportantContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :important_contacts do |t|
      t.string :phone_number
      t.string :name
      t.string :address
      t.string :email
      t.references :pregnancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
