class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, limit: 50, null: false
      t.text :blog_content
      
      t.timestamps null: false
    end
  end
end
