class User < ActiveRecord::Base
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
