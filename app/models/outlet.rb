class Outlet < ActiveRecord::Base
  belongs_to :merchant
  has_many :bookings

end
