class User < ActiveRecord::Base

  after_initialize :set_default_password, if: :new_record?

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  has_many :authentications, dependent: :destroy

  accepts_nested_attributes_for :authentications


  authenticates_with_sorcery!

  has_many :payments
  has_many :bookings
  has_many :merchants

  def admin?
  	self.role?
  end

  def service?
  end

  def consumer?
  end

  def set_as_admin
  end

  def set_as_service
  end

  def set_as_consumer
  end

  private

  def set_default_password
    return unless self.password.nil?
    password = SecureRandom.hex
    self.password = password
    self.password_confirmation = password
  end
end
