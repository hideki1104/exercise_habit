class TrainingsController < ApplicationController
  def create
    training = Training.new(training_params)
    if training.save
      render json: training
    else
      render json: training.errors
    end
  end

  def index
    trainings = Training.all
    render json: trainings
  end

  def show
    training = Training.find(params[:id])
    render json: training
  end

  def update
  end

  def destroy
    training = Training.find(params[:id])
    render json: training.destroy
  end

  private
  def training_params
    params.permit(:name, :url, :training_type, :difficuly_type, :genre_id, :thumbnail_id, :descrription)
  end
end
