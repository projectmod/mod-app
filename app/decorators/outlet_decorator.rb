class OutletDecorator < BaseDecorator

  def last_image_index
    model.images.length - 1
  rescue
    0
  end

  def images
    return [ "merchant_default.jpg" ] if model.images.empty?

    model.images.map { |i| i.content.url } 
  end
end
