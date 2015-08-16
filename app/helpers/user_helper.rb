module UserHelper
  def bookings(credits)
    pluralize(credits / 2, 'BOOKING').upcase
  end

  def render_account_link
    if current_user.merchant?
      html = link_to("ACCOUNT", merchants_dashboard_path, class: "alignment nav-header-highlight")
    else
      html = link_to("ACCOUNT", dashboard_account_path, class: "#{is_active?('dashboard/account#index')} alignment nav-header-highlight")
    end

    html.html_safe
  end

  def render_merchant_availability_link(device)
    if current_user.outlet.availability
      html = render partial: 'merchants/shared/partials_header/available', locals: { outlet: current_user.outlet, device: device }
    else
      html = render partial: 'merchants/shared/partials_header/unavailable', locals: { outlet: current_user.outlet, device: device }
    end

    html.html_safe
  end
end
