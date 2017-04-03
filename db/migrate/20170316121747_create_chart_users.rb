class CreateChartUsers < ActiveRecord::Migration
  def change
    create_table :chart_users do |t|
      t.integer :chart_id,  null: false
      t.integer :user_id,  null: false
      t.integer :rank

      t.timestamps null: false
    end

    add_index :chart_users, [:chart_id, :user_id], unique: true
  end
end
