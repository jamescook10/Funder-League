class GameController < ApplicationController
  def create
    @game = Game.new(game_params)
    @game.save
    render dashboard_path
  end

  private

  def game_params
    params.require(:game).permit(:game_type_id, :player_score, :opponent_score, :opponent_id)
  end
end
