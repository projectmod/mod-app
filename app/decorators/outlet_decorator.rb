class OutletDecorator < BaseDecorator

  def uploaded_images
    images = model.images.order("created_at ASC").select { |i| !i.new_record? }

    return [ "merchant_default.jpg" ] if images.empty?

    images.map { |i| i.content.url }
  end

  def first_image
    model.images.first.content.url
  rescue
    "merchant_default.jpg"
  end

  def salon_services
    model.type_of_service
  end

  def first_banner
    model.images.first.content.banner.url
  rescue
    "merchant_default.jpg"
  end

  def last_image_index
    uploaded_images.length - 1
  rescue
    0
  end
end
