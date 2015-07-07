class Booking < ActiveRecord::Base
  belongs_to :outlet
  belongs_to :user
end
