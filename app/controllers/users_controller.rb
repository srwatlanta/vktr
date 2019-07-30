class UsersController < ApplicationController
  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      errors = @user.errors.full_messages
      flash[:errors] = errors 
      redirect_to new_user_path
    end
  end

  def edit
    find_user
  end

  def update
    find_user
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  private
  #strong params
  def user_params
    params.require(:user).permit(:username, :email, :location, :img_url, :age)
  end

  #find method
  def find_user
    @user = User.find_by(id: params[:id])
  end
end
