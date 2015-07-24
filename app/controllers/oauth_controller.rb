class OauthController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback

    provider = auth_params[:provider]

    user = login_from(provider) || current_user
    auth = Users::Oauth.new(@access_token, provider, user)

    # Log in user

    if logged_in? && user.email?
      flash[:notice] = "Logged in from #{provider.titleize}."

    # Link user to Facebook

    else
      new_user = auth.register
      add_provider_to_user(provider) unless user.authentications.find_by(provider: provider)

      reset_session
      auto_login(new_user)
      flash[:notice] = "You've registered through #{provider.titleize}."
    end

    redirect_to request.referrer
  end

  def auth_params
    params.permit(:code, :provider)
  end
end
