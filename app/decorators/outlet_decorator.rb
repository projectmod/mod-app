class OutletDecorator < BaseDecorator

  def uploaded_images
    images = model.images.order("created_at ASC").select { |i| !i.new_record? }

    return [ "merchant_default.jpg" ] if images.empty?

    images.map { |i| i.content.url }
  end

  def name
    model.name.upcase
  end

  def area
    model.area.upcase
  end

  def address
    model.address.upcase
  end

  def display_phone_number
    "+6" + model.phone_number
  end

  def salon_services
    model.type_of_service.split(', ')
  end

  def main_image
    model.images.first.content.url
  rescue
    "merchant_default.jpg"
  end

  def main_banner
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
