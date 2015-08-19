class Merchants::BaseController < ApplicationController
  layout "merchant"
  before_action :require_login
  before_action :is_merchant?

  def is_merchant?
    unless current_user.merchant?
      redirect_to root_path
      flash[:notice] = "You're not authorized to access this page, sorry!"
    end
  end
end
