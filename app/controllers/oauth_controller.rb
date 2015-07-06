class OauthController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    
    provider = auth_params[:provider]
    @user = login_from(provider)
    auth = Users::Oauth.new(@access_token, provider)

    # Log in user

    if logged_in?
      flash[:notice] = "Logged in from #{provider.titleize}."

    # Register user

    else
      new_user = auth.register

      new_user.activate!
      reset_session

      auto_login(new_user)

      flash[:notice] = "You've registered through #{provider.titleize}."
    end

    redirect_to root_path
  end

  def auth_params
    params.permit(:code, :provider)
  end
end
