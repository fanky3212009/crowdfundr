class AddPledgeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pledge, :integer, default: 0
  end
end
