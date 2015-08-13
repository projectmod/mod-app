class Image < ActiveRecord::Base
  belongs_to :outlet
  mount_uploader :content, ImageUploader
end
