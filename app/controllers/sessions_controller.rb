class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
      flash[:success] = "Logged in as #{@user.username}"
    else
      flash.new[:notice] = "Invalid login."
      render :new
    end
  end
end
