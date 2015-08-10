class Image
  belongs_to :outlet
  mount_uploader :content, ImageUploader
end
