class GamesController < ApplicationController

  def create
    @game = Game.new(game_params, :player_id => current_player.id)
    if @game.valid?
      @game.save
      redirect_to dashboard_path
    else
      render "dashboard/show"
    end
  end

  private

  def game_params
    params.require(:game).permit(:game_type_id, :player_score, :opponent_score, :opponent_id)
  end
end
