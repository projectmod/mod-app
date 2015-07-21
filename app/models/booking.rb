class Booking < ActiveRecord::Base
  belongs_to :outlet
  belongs_to :user

  scope :previously_booked, -> { where("created_at < ?", 15.minutes.ago) }
  scope :just_booked, -> { where("created_at > ?", 15.minutes.ago).last }
end
