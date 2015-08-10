class OutletDecorator < BaseDecorator

  def last_image_index
    model.avatar.length-1
  rescue
    0
  end

  def images
    model.avatar || ["http://www.aquasalonnewportbeach.com/img/slides/slide-bg2.jpg"]
  end
end
