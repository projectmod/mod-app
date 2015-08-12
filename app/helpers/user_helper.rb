module UserHelper

  def bookings(credits)
    credits / 2
  end

  def render_account_link
    if current_user.merchant?
      html = link_to("ACCOUNT", merchants_dashboard_path, class: "alignment nav-header-highlight")
    else
      html = link_to("ACCOUNT", dashboard_account_path, class: "#{is_active?('dashboard/account#index')} alignment nav-header-highlight")
    end

    html.html_safe
  end
end
