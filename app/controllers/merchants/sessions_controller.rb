class Merchants::SessionsController < Merchants::BaseController
  skip_before_action :require_login, except: :destroy
  skip_before_action :is_merchant?, except: :destroy

  def new
    @user = User.new
  end

  def create
    @user = login(params[:merchants_sessions][:email], params[:merchants_sessions][:password])
    @outlet = @user.try(:outlet)

    return redirect_to(root_path, flash: { notice: "You have entered the wrong email or password. Please try again!" }) unless @user
    return redirect_to(root_path, flash: { notice: "Sorry, you're not authorized to log in." }) unless @user.merchant?
    return redirect_to(merchants_dashboard_path, flash: { notice: "You've logged in, welcome back!" }) if @user.active_merchant?
    return redirect_to(root_path, flash: { notice: "We're currently processing your registration, please check back later!"}) if @outlet.completed_registration?
    return redirect_to(merchants_outlet_step_path(@outlet, "outlet_info"), flash: { notice: "You've not completed your registration, please complete it now!" })
  end

  def destroy
  end
end
