class Merchants::BaseController < ApplicationController
  layout "merchant"
  before_action :require_login
  before_action :is_merchant?
  before_action :redirect_if_user

  def is_merchant?
    if !current_user.merchant?
      call_redirect
    end
  end

  def redirect_if_user
    if current_user && current_user.user?
      call_redirect
    end
  end

  private

  def call_redirect
    redirect_back_or_to root_path
    flash[:notice] = "Sorry, you're not authorized to access this page."
  end
end
