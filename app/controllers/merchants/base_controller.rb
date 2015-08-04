class Merchants::BaseController < ApplicationController
  # before_action :is_merchant?
  layout 'merchants'

  def is_merchant?
    if current_user.user?
      redirect_to root_path
      flash[:notice] = "You're not authorized to access this page, sorry!"
    end
  end
end
