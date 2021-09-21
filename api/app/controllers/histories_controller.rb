class HistoriesController < ApplicationController

  def create
    history = History.new(history_params)
    history.user_id = current_api_user.id
    if history.save
      render json: history
    else
      render json: history.errors
    end
  end

  def index
    histories = User.joins(:trainings).select("trainings.name, trainings.url, trainings.thumbnail_id, histories.id, histories.set_count, histories.created_at").where(id: current_api_user.id)
    render json: histories
  end

  private
  def history_params
    params.permit(:training_id, :set_count)
  end
end
