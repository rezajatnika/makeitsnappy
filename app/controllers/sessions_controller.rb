class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      login user
      flash[:success] = 'You are logged in!'
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid username/password.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You are now logged out!'
  end
end
