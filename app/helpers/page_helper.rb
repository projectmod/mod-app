module PageHelper

  def is_active?(page_name)
    "active" if params[:controller] + "#" + params[:action] == page_name
  end

  def get_offset(i)
    return "col-md-offset-0" if i % 2 != 0
    "col-md-offset-1"
  end

  def fetch_image(image)
    return image.content.url if image.content.url
    "uploader.png"
  end

  def render_header
    if current_user && current_user.merchant?
      partial = render 'merchants/shared/header'
    else
      partial = render 'shared/header'
    end

    partial.html_safe
  end

end
