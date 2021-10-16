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

  def index
    posts = User.joins(:post_trainings).select("posts.id, posts.text, posts.created_at, users.name as user_name, users.id as user_id, trainings.name as training_name, trainings.url, trainings.thumbnail_id").order("posts.created_at DESC")

    render json: posts
  end

  private
  def post_params
    params.permit(:text, :training_id)
  end
end
