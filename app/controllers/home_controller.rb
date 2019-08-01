class HomeController < ApplicationController
  def index
    @top_viewed_video = Video.highest_view_count_top_five
    @most_reviewed_video = Video.most_reviewed_top_five
    @lowest_rated_video = Video.lowest_rated_top_five
    @highest_rated_video = Video.highest_rated_top_five
    @most_reviews_user = User.most_reviews_top_five

    @nicest_user = User.highest_ratings_top_five
    @meanest_user = User.lowest_ratings_top_five
    @top_rated_director = Director.best_rating_top_five
    @top_viewed_director = Director.top_viewed_top_five
    @top_rated_artist = Artist.best_rating_top_five
    @top_viewed_artist = Artist.top_viewed_top_five
    @top_rated_genre = Genre.best_rating_top_five
    @top_viewed_genre = Genre.top_viewed_top_five
  end
end
