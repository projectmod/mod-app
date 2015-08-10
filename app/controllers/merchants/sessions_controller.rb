class Merchants::SessionsController < Merchants::BaseController

  def new
    @user = User.new
  end

  def create
    @user = login(params[:merchants_sessions][:email], params[:merchants_sessions][:password])

    return redirect_to(root_path, flash: { error: "You have entered the wrong email or password. Please try again!" }) unless @user
    return redirect_to(root_path, flash: { error: "Sorry, you're not authorized to log in." }) unless @user.merchant?

    if @user.active_merchant?
      flash[:success] = "You've logged in, welcome back!"
      redirect_to merchants_dashboard_path
    else
      @outlet = @user.outlet
      redirect_to merchants_outlet_step_path(@outlet, "salon_info")
    end
  end

  def destroy
  end
end
