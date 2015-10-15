class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :owner_task_id
      t.integer :user_id
      t.string :name_string
      t.text :description
      t.datetime :due_at
      t.float :position
      t.integer :category_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
