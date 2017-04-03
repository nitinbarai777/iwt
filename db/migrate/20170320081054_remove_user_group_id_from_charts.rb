class RemoveUserGroupIdFromCharts < ActiveRecord::Migration
  def change
    remove_column :charts, :user_group_id, :integer
  end
end
