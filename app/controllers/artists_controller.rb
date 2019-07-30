class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    find_artist
  end

  private

  def find_artist
    @artist = Artist.find_by(id: params[:id])
  end
end
