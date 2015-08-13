module PageHelper

  def is_active?(page_name)
    "active" if params[:controller] + "#" + params[:action] == page_name
  end

  def get_offset(i)
    return "col-md-offset-2" if i % 2 != 0 
    "col-md-offset-1"
  end
end
