class TrainingsController < ApplicationController
  def create
  end

  def training_params
    params.permit(:name, :url, :training_type, :difficuly_type, :genre_id)
  end
end
