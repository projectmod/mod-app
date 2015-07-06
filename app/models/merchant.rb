class Merchant < ActiveRecord::Base
  has_many :outlets
  belongs_to :user

  mount_uploader :avatar, ImageUploader
end
