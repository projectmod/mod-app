class Merchant < ActiveRecord::Base
  has_many :outlets
  
  has_many :roles
  has_many :users, through: :roles

  mount_uploader :avatar, ImageUploader
end
