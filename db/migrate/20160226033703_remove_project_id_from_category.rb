class RemoveProjectIdFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :project_id, :integer
    add_column :projects, :category_id, :integer
  end
end
