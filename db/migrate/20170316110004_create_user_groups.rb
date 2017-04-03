class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name, limit: 50, null: false

      t.timestamps null: false
    end
  end
end
