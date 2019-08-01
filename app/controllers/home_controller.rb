class HomeController < ApplicationController
  def index
    @top_viewed_video = Video.highest_view_count_top_five
    @most_reviewed_video = Video.most_reviewed_top_five
    @lowest_rated_video = Video.lowest_rated_top_five
    @highest_rated_video = Video.highest_rated_top_five

    @most_reviews_user = User.most_reviews_top_five
    @nicest_user = User.highest_ratings_top_five
    @meanest_user = User.lowest_ratings_top_five

    @worst_rated_director = Director.worst_reviewed_top_five
    @top_viewed_director = Director.most_viewed_top_five
    @top_rated_director = Director.best_reviewed_top_five

    @worst_rated_artist = Artist.worst_reviewed_top_five
    @top_viewed_artist = Artist.most_viewed_top_five
    @top_rated_artist = Artist.best_reviewed_top_five

    @worst_rated_genre = Genre.worst_reviewed_top_five
    @top_rated_genre = Genre.best_reviewed_top_five
    @top_viewed_genre = Genre.most_viewed_top_five

    render layout: 'home_layout'
  end

end
