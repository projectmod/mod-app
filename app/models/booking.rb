class Booking < ActiveRecord::Base
  belongs_to :merchant, :user
end
