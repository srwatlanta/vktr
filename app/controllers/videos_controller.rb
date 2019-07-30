class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    find_video
    @review = Review.new
    @user = User.find_by(id: session[:user_id])
  end

  private

  def find_video
    @video = Video.find(params[:id])
  end
end
