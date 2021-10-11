class LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors
    end
  end

  def destroy
    path    = request.fullpath.split("/")
    post_id = path[-3]
    user_id = path[-1]
    render json: Like.find_by(post_id: post_id, user_id: user_id).destroy
  end

  private
  def like_params
    params.permit(:post_id, :user_id)
  end
end
