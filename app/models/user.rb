class User < ActiveRecord::Base

  after_initialize :set_default_password, if: :new_record?

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 5 }, if: :password
  validates :password, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password
  validates :email, uniqueness: true, if: :email

  has_many :authentications, dependent: :destroy
  has_many :payment_transactions
  has_many :bookings
  has_one :outlet

  mount_uploader :avatar, ImageUploader

  def activate
    update(activated: true)
  end

  def add_credits(credits)
    if credits > 0
      self.credits += credits
    end
  end

  private

  def set_default_password
    return unless self.password.nil?
    password = SecureRandom.hex
    self.password = password
    self.password_confirmation = password
  end
end
