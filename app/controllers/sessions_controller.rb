class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if current_admin?
        redirect_to admin_dashboard_index_path(@user)
        flash[:success] = "Logged in as #{@user.username}"
      else
        redirect_to @user
        flash[:success] = "Logged in as #{@user.username}"
      end
    else
      flash[:notice] = 'Invalid Login'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Thanks for visiting. Keep shreddin'"
    redirect_to login_path
  end
end
