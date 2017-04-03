class User < ActiveRecord::Base

  after_create :generate_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_token :token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_user_groups, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :user_user_groups, allow_destroy: true

  has_many :user_groups, :through => :user_user_groups

  has_many :chart_users, inverse_of: :user, dependent: :destroy
  has_many :charts, :through => :chart_users

  validates :first_name, :presence => true, :length => {:maximum => 50}
  validates :last_name, :length => {:maximum => 50, :allow_blank => true}
  validates :manager_id, :length => {:maximum => 50, :allow_blank => true}
  validates :email, :presence => true, :length => {:maximum => 50}

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def generate_token
    self.update_attributes(token: SecureRandom.hex(10), token_expire: Time.now + 60.minute)
  end

end
