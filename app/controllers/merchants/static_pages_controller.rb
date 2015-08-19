class Merchants::StaticPagesController < Merchants::BaseController
  skip_before_action :require_login
  skip_before_action :is_merchant?

  def success
  end
end
