class AddColumnsToStatusAndCategories < ActiveRecord::Migration
  def change
    add_column :statuses, :user_id, :integer
    add_column :categories, :color, :string
  end
end
