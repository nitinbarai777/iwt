class CreateUserUserGroups < ActiveRecord::Migration
  def change
    create_table :user_user_groups do |t|
      t.integer :user_id,  null: false
      t.integer :user_group_id,  null: false

      t.timestamps null: false
    end

    add_index :user_user_groups, [:user_id, :user_group_id], unique: true
  end
end
