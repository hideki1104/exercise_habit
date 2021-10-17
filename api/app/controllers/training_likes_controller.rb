class TrainingLikesController < ApplicationController
  def create
    training_like = TrainingLike.new(training_like_params)
    training_like.user_id = current_api_user.id
    if training_like.save
      render json: training_like
    else
      render json: training_like.errors
    end
  end

  def show
    training_id = params[:training_id]
    render json: TrainingLike.find_by(training_id: training_id, user_id: current_api_user.id)
  end

  def destroy
    training_id = params[:training_id]
    render json: TrainingLike.find_by(training_id: training_id, user_id: current_api_user).destroy
  end

  private
  def training_like_params
    params.permit(:training_id)
  end
end
