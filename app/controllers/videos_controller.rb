class VideosController < ApplicationController
  def index
    @videos = Video.highest_view_count
  end

  def show
    find_video
    @video.count += 1
    @video.save
    @review = Review.new
    @user = User.find_by(id: session[:user_id])
  end

  private

  def find_video
    @video = Video.find(params[:id])
  end
end
