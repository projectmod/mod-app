class Merchants::SessionsController < Merchants::BaseController

  def new
    @user = User.new
  end

  def create
    @user = login(params[:merchants_sessions][:email], params[:merchants_sessions][:password])

    if @user.active_merchant?
      flash[:success] = "Logged in!"
      redirect_to merchants_dashboard_path
    else
      @outlet = @user.outlet
      redirect_to merchants_outlet_step_path(@outlet, "salon_info")
    end
  end

  def destroy
  end
end
