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

  private
  def training_like_params
    params.permit(:training_id)
  end
end
