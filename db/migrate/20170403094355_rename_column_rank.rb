class RenameColumnRank < ActiveRecord::Migration
  def change
    change_column :users, :rank, :string
  end
end
