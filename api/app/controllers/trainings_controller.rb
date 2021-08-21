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

  def update
  end

  def destroy
  end

  private
  def training_params
    params.permit(:name, :url, :training_type, :difficuly_type, :genre_id)
  end
end
