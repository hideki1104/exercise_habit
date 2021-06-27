class WeightsController < ApplicationController
  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      render json: @weight
    else
      render json: @weight.errors
    end
  end

  def weight_params
    params.permit(:weight, :user_id)
  end
end
