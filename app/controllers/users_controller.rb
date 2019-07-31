class UsersController < ApplicationController
  def show
    find_user
  end

  def new
    if logged_in?
      redirect_to @current_user
    else
    @user = User.new
    render :new
    end
  end

  def create
    @user = User.new(user_params)
    
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def edit
    if logged_in? && @current_user.id == params[:id]
      @user = @current_user
      render :edit
    else
      redirect_to @current_user || login_path
    end
  end

  def update
    find_user
    @user = User.update(user_params)
    redirect_to @user
  end

  private
  #strong params
  def user_params
    params.require(:user).permit(:username, :email, :password, :location, :img_url, :age)
  end

  #find method
  def find_user
    @user = User.find_by(id: params[:id])
  end
end
