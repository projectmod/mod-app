module PageHelper

  def is_active?(page_name)
    "active" if params[:controller] + "#" + params[:action] == page_name
  end
end
