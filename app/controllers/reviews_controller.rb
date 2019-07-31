class ReviewsController < ApplicationController
  def show
    @review = Review.find_by(id: params[:id])
  end

  def new
    @review = Review.new
    @user = User.find_by(id: session[:user_id])
    @video = Video.find_by(id: params[:id])
  end

  def create
    @review = Review.new(review_params)
    @user = User.find_by(id: params[:review][:user_id])
    @video = Video.find_by(id: params[:review][:video_id])
    if @review.save
      redirect_to video_path(@video)
    else
      @errors = @review.errors.full_messages
      flash[:errors] = @errors
      redirect_to video_path(@video)
    end
  end

  def edit
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:content, :kill_rating, :user_id, :video_id)
  end
end
