class GamesController < ApplicationController

  before_action :authenticate_player!

  def index
    @games = current_player.games.includes(:game_type)
  end

  def create
    game_attributes = game_params
    game_attributes[:player_id] = current_player.id
    @game = Game.new(game_attributes)
    if @game.valid?
      @game.save
      redirect_to my_games_path
      flash[:success] = "New result added!"
    else
      render "dashboard/index"
    end
  end

  def edit
    
  end

  private

  def game_params
    params.require(:game).permit(:game_type_id, :player_score, :opponent_score, :opponent_id)
  end
end
