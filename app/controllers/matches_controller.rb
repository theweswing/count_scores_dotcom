class MatchesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    render json: Match.all, include: :players, status: :ok
  end

  def show
    found_match = find_match
    render json: found_match, status: :ok
  end

  def create
    new_match = Match.create!(match_params)
    render json: new_match, status: :created
  end

  def destroy
    found_match = find_match
    head :no_content, status: :no_content
  end

  private

  def find_match
    Match.find(params[:id])
  end

  def match_params
    params.permit(:game_id, :date)
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
