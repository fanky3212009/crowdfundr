class RemovePledgeFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :pledge 
  end
end
