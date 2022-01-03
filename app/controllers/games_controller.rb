class GamesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    render json: Game.all, status: :ok
  end
  def show
    found_game = Game.find(params[:id])
    render json: found_game, status: :ok
  end
  def create
    new_game = Game.create!(game_params)
    render json: new_game, status: :created
  end

  private

  def game_params
    params.permit(:name)
  end

  def render_not_found
    render json: { error: 'user not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
