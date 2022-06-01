class ChangeTypeToTask < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, USING start_time::integer
    change_column :tasks, :deadline, :integer
  end
end
