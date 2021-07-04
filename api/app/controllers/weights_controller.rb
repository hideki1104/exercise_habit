class WeightsController < ApplicationController

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

  def update
    @weight = Weight.find(params[:id])
    if @weight.update(weight_params)
      render json: @weight
    else
      render json: @weight.errors
    end
  end

  def weight_params
    params.permit(:weight)
  end
end
