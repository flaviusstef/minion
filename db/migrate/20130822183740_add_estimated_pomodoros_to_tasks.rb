class AddEstimatedPomodorosToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :estimated_pomodoros, :integer, default: 0
  end
end
