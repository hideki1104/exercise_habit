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

  def recommended_trainings
    trainings = Training.where("trainings.training_type": current_api_user.training_type).limit(3)
    render json: trainings
  end

  def recent_trainings
    trainings = Training.where(id: History.select(:training_id).where("histories.user_id": current_api_user.id )).limit(3)
    render json: trainings
  end

  def show
    training = Training.find(params[:id])
    render json: training
  end

  def update
    training = Training.find(params[:id])
    if training.update(training_params)
      render json: training
    else
      render json: training.errors
    end
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
