class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    find_genre
  end

  private

  def find_genre
    @genre = Genre.find_by(id: params[:id])
  end
end
