class RelationshipsController < ApplicationController
  def create
    render json: current_api_user.follow(params[:user_id])
  end

  def destroy
    render json: current_api_user.unfollow(params[:user_id])
  end
end
