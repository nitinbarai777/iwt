class CreateChartUserGroups < ActiveRecord::Migration
  def change
    create_table :chart_user_groups do |t|
      t.integer :chart_id,  null: false
      t.integer :user_group_id,  null: false
      t.timestamps null: false
    end
    add_index :chart_user_groups, [:chart_id, :user_group_id], unique: true
  end
end
