class FixNameColumnInTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :name_string, :name
  end
end
