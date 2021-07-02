class WeightsController < ApplicationController
  before_action :authenticate_api_user!

  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      render json: @weight
    else
      render json: @weight.errors
    end
  end

  def show
    @weight = current_api_user.weights.order(updated_at: :desc).limit(1)
    render json: @weight
  end

  def weight_params
    params.permit(:weight, :user_id)
  end
end
