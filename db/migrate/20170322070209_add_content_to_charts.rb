class AddContentToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :content, :text
  end
end
