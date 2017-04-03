class ChartUserGroup < ActiveRecord::Base

  belongs_to :chart, inverse_of: :chart_user_groups
  belongs_to :user_group, inverse_of: :chart_user_groups

end
