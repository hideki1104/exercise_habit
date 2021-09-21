class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    post.user_id = current_api_user.id
    if post.save
      render json: post
    else
      render json: post.errors
    end
  end

  private
  def post_params
    params.permit(:text)
  end
end
