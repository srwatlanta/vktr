class ArtistsController < ApplicationController
  def index
    @artists = Artist.alphabetize
  end

  def show
    find_artist
    @artists = Artist.all
  end

  private

  def find_artist
    @artist = Artist.find_by(id: params[:id])
  end
end
