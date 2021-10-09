class LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors
    end
  end

  private
  def like_params
    params.permit(:post_id, :user_id)
  end
end
