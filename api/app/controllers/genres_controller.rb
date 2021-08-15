class GenresController < ApplicationController
  def create
    genre = Genre.new(training_params)
    if genre.save
      render json: genre
    else
      render json: genre.errors
    end
  end

  def index
    genres = Genre.all
    render json:genres
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(training_params)
      render json: genre
    else
      render json: genre.errors
    end
  end

  def destroy
    render json: Genre.find(params[:id]).destroy
  end

  private
  def training_params
    params.permit(:name)
  end
end
