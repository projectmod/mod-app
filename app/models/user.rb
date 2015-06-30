class User < ActiveRecord::Base
 
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

  def name
  	self.email
  end

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

end
