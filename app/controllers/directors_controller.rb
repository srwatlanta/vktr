class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    find_director
  end

  private

  def find_director
    @director = Director.find_by(id: params[:id])
  end
end
