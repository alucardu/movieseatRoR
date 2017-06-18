class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.all
    json_response(@movies)
  end

  # POST /movies
  def create
    @movie = Movie.create!(movie_params)
    json_response(@movie, :created)
  end

  # UPDATE /movies:id
  def update
    @movie.update(movie_params)
    head :no_content
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy
    head :no_content
  end

  def movie_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end


end
