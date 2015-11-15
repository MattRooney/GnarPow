class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
      flash[:success] = "Logged in as #{@user.username}"
    else
      flash.now[:error] = 'Username and password are required.'
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      render file: 'public/404'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
