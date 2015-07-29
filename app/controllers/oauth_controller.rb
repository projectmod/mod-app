class OauthController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    outlet_id = session[:prebk_outlet]
    provider = auth_params[:provider]

    user = login_from(provider) || current_user
    auth = Users::Oauth.new(@access_token, provider, user)

    # Log in user
    if logged_in?
      flash[:notice] = "Logged in from #{provider.titleize}."

      if outlet_id
        outlet = Outlet.find(outlet_id)
        redirect_to outlet_path(outlet)
      else
        redirect_to dashboard_account_path
      end

    # Register User
    else
      new_user = auth.register

      reset_session
      auto_login(new_user)
      flash[:notice] = "You've registered through #{provider.titleize}."

      redirect_to edit_user_path(new_user)
    end
  end

  def auth_params
    params.permit(:code, :provider)
  end
end
