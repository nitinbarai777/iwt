class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :name, limit: 50, null: false
      t.integer :user_group_id,  null: false

      t.timestamps null: false
    end
  end
end
