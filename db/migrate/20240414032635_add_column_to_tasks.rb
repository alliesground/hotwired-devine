class AddColumnToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :complete, :boolean, default: false
  end
end
