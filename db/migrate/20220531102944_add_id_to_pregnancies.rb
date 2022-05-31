class AddIdToPregnancies < ActiveRecord::Migration[7.0]
  def change
    change_table(:pregnancies) do |t|
      t.references :mother, foreign_key: { to_table: 'users' }
      t.references :partner, foreign_key: { to_table: 'users' }, null: true
    end
  end
end
