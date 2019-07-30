class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    end
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:errors] = ["invalid credentials"]
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
