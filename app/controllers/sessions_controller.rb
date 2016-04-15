class SessionsController < ApplicationController
  def create
    user = User.find_by(gamertag: params[:gamertag])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Invalid login credentials - try again!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

end
