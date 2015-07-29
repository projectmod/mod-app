class Booking < ActiveRecord::Base
  belongs_to :outlet
  belongs_to :user

  scope :previously_booked, -> { where("created_at < ?", 15.minutes.ago) }
  scope :just_booked, -> { where("created_at > ? AND user_cancellation = ?", 15.minutes.ago, false) }
end
