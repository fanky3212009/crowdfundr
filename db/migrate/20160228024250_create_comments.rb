class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
