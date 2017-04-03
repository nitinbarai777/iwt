class Chart < ActiveRecord::Base

  # belongs_to :user_group, inverse_of: :charts

  has_many :chart_users, inverse_of: :chart, dependent: :destroy
  accepts_nested_attributes_for :chart_users, allow_destroy: true

  has_many :users, through: :chart_users

  has_many :chart_user_groups, inverse_of: :chart, dependent: :destroy
  accepts_nested_attributes_for :chart_user_groups, allow_destroy: true

  has_many :user_groups, :through => :chart_user_groups

  # validates :user_group, :presence => true
  validates :name, :uniqueness => true
  validates :name, :presence => true, :length => {:maximum => 50}

end