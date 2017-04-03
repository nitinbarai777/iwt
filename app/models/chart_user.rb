class ChartUser < ActiveRecord::Base

  belongs_to :chart, inverse_of: :chart_users
  belongs_to :user, inverse_of: :chart_users

  validates :chart, :presence => true
  validates :user, :presence => true

  validates_uniqueness_of :user_id, scope: :chart_id

end
