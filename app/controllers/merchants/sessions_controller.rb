class Merchants::SessionsController < Merchants::BaseController

  def new
    @user = User.new
  end

  def create
    @user = login(params[:merchants_sessions][:email], params[:merchants_sessions][:password])
    
    if @user.active_merchant?
    
      flash[:success] = "You're logged in! Welcome back!"
      redirect_to merchants_dashboard_path
    else
    
      @outlet = @user.outlet
      redirect_to merchants_outlet_step_path(@outlet, "salon_info")
    end
  rescue
    flash[:error] = "You have entered the wrong email or password. Please try again!"
    redirect_to root_path
  end

  def destroy
  end
end
