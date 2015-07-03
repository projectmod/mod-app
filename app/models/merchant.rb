class Merchant < ActiveRecord::Base
  has_many :bookings
  belongs_to :user

  mount_uploader :avatar, ImageUploader
end
