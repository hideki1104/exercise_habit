class WeightsController < ApplicationController

  def create
    weight = current_api_user.weights.find_or_initialize_by(created_at: Date.today)

    if weight.new_record?
      weight.weight  = weight_params['weight']
      weight.user_id = current_api_user.id
      render json: weight.save
    end

    render json: weight.update(weight_params)
  end

  def index
    @weights = current_api_user.weights
    render json: @weights
  end

  def show
    @weight = current_api_user.weights.order(updated_at: :desc).limit(1)
    render json: @weight
  end

  def edit
    select_month      = params[:id]
    select_month_text = select_month.insert(4, "-")
    start_date_text   = select_month_text.insert(7, "-01")
    start_date        = Date.parse(start_date_text)
    end_date          = start_date.end_of_month
    @weights = current_api_user.weights.where("created_at >= ?", start_date).where("created_at <= ?", end_date)
    render json: @weights
  end

  def update
    @weight = Weight.find(params[:id])
    if @weight.update(weight_params)
      render json: @weight
    else
      render json: @weight.errors
    end
  end

  private
  def weight_params
    params.permit(:weight, :user_id)
  end
end
