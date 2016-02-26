class AddOwnerIdtoProjects < ActiveRecord::Migration
  def change
    add_column :projects, :owner_id, :integer, index: true, foreign_key: true

  end
end
