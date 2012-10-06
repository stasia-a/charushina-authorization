class User < ActiveRecord::Base
  attr_accessor :admin
  attr_accessible :email, :login, :password, :password_confirmation, :full_name
  has_secure_password

  validates :login, presence: true, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :auth_secret, presence: true
  validates :full_name, length: { maximum: 26 }

  before_save { |user| user.email = email.downcase }
  after_save {|user| first_user_is_admin(user)}
  before_validation :assign_auth_secret, on: :create

  has_many :sessions
  accepts_nested_attributes_for :sessions

  def first_user_is_admin(user)
    user.admin = true if first_user?
  end

  private

  def first_user?
    User.count == 1
  end

  def assign_auth_secret
    self.auth_secret = ROTP::Base32.random_base32
  end
end
