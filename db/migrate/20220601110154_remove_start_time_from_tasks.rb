class RemoveStartTimeFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :start_time
    remove_column :tasks, :deadline
    add_column :tasks, :start_time, :integer
    add_column :tasks, :deadline, :integer
  end
end
