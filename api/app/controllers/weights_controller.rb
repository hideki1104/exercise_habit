class WeightsController < ApplicationController
  def create
    @user = User.new(weight_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def weight_params
    params.permit(:weight, :user_id)
  end
end
