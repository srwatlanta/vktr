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
    find_review
    if logged_in? && @current_user.id == @review.user.id
      render layout: "edit_comment"
    else
      redirect_to user_path(@current_user)
    end
  end

  def update
    find_review
    @review.update(review_params)
    redirect_to video_path(@review.video)
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.delete
    redirect_to video_path(@review.video_id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :kill_rating, :user_id, :video_id)
  end

  def find_review
    @review = Review.find_by(id: params[:id])
  end
end
