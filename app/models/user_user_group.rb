class UserUserGroup < ActiveRecord::Base

  belongs_to :user, inverse_of: :user_user_groups
  belongs_to :user_group, inverse_of: :user_user_groups

  validates :user, :presence => true
  validates :user_group, :presence => true

  validates_uniqueness_of :user_id, scope: :user_group_id
  
end
