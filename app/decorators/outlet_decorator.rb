class OutletDecorator < BaseDecorator

  def last_image_index
    model.avatar.length-1
  rescue
    0
  end

  def images
    model.avatar || [ "merchant_default.jpg" ]
  end
end
