class User < ActiveRecord::Base

  after_initialize :set_default_password, if: :new_record?

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates :password, length: { minimum: 5 }, if: :password
  validates :password, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password

  validates :email, uniqueness: true
  has_many :authentications, dependent: :destroy

  mount_uploader :avatar, ImageUploader

  accepts_nested_attributes_for :authentications

  authenticates_with_sorcery!

  has_many :payments
  has_many :bookings

  has_many :roles
  has_many :merchants, through: :roles

  def activate
    self.activation_state = "active"
  end
  
  #Checking for roles
  def admin?
    self.role == "admin"
  end

  def merchant?
    self.role == "merchant"
  end

  def user?
    self.role == "user"
  end

  #Setting roles
  def set_as_admin
    self.role = "admin"
  end

  def set_as_merchant
    self.role = "merchant"
  end

  def set_as_user
    self.role = "user"
  end

  private

  def set_default_password
    return unless self.password.nil?
    password = SecureRandom.hex
    self.password = password
    self.password_confirmation = password
  end
end
