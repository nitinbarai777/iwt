class UserGroup < ActiveRecord::Base

  has_many :user_user_groups, inverse_of: :user_group, dependent: :destroy
  accepts_nested_attributes_for :user_user_groups, allow_destroy: true

  has_many :users, :through => :user_user_groups

  # has_many :charts, inverse_of: :user_group, dependent: :destroy

  has_many :chart_user_groups, inverse_of: :chart, dependent: :destroy
  accepts_nested_attributes_for :chart_user_groups, allow_destroy: true

  has_many :charts, :through => :chart_user_groups

  validates :name, :presence => true, :length => {:maximum => 50}

end
