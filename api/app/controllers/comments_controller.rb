class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors
    end
  end

  def index
    post_id = request.fullpath.split("/")[-2]
    comments = User.joins(:comment_posts).select("comments.id, comments.text, comments.created_at, comments.user_id, comments.post_id, users.name").where("comments.post_id": post_id)

    render json: comments
  end

  private
  def comment_params
    params.permit(:text, :post_id, :user_id)
  end
end
