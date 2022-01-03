class PlayersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    render json: Player.all, status: :ok
  end
  def show
    found_player = find_player
    render json: found_player, status: :ok
  end
  def create
    new_player = Player.create!(player_params)
    render json: new_player, status: :created
  end
  def update
    found_player = find_player
    found_player.update!(player_params)
    render json: found_player, status: :accepted
  end
  def destroy
    found_player = find_player
    found_player.destroy
    head :no_content, status: :no_content
  end

  private

  def find_player
    Player.find(params[:id])
  end

  def player_params
    params.permit(:user_id, :match_id, :score, :is_winner, :name)
  end

  def render_not_found
    render json: { error: 'player not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end