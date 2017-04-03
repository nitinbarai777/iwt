class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50
      #t.string :email, limit: 50, null: false
      t.string :manager_id, limit: 50

      t.timestamps null: false
    end
  end
end
