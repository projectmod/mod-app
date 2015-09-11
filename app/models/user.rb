class User < ActiveRecord::Base

  after_initialize :set_default_password, if: :new_record?
  before_validation :set_default_email, if: :new_record?
  
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates :password, length: { minimum: 5 }, if: :password
  validates :password, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password
  validates_numericality_of :phone_number, only_integer: true, message: "is not valid! Please enter only 0 to 9 digits for your phone number.", if: :phone_number
  validates :phone_number, uniqueness: true, if: :phone_number
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: [:create, :update] }, if: :email

  has_many :authentications, dependent: :destroy
  has_many :bookings
  has_many :payment_transactions
  has_one :outlet

  accepts_nested_attributes_for :authentications

  enum role: [:user, :merchant, :admin]

  def activate
    update(activated: true)
  end

  def active_merchant?
    activated? && outlet.present?
  end

  def add_credits(credits)
    if credits > 0
      self.credits += credits
    end
  end

  private

  def set_default_email
    return unless self.email.nil?
    self.email = loop do
      email = "#{SecureRandom.urlsafe_base64}@changeme.com"
      break email unless User.where(email: email).exists?
    end
  end

  def set_default_password
    return unless self.password.nil?
    password = SecureRandom.hex
    self.password = password
    self.password_confirmation = password
  end
end
