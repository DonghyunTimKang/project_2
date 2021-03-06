class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = 'You are are registered'
         session[:user_id] = user.id

      redirect_to user_path user.id
    else
      flash[:error] = 'Registration has failed'
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:gamertag, :password, :password_confirmation, :name)
  end

end
