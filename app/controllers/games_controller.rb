class GamesController < ApplicationController

  before_action :authenticate_player!

  def index
    @games = current_player.games.includes(:game_type)
  end

  def create
    @game_types = GameType.all
    @data = DashboardPresenter.new(current_player)
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
    @data = DashboardPresenter.new(current_player)
    @game_types = GameType.all
    @game = current_player.games.find(params[:id])
    @game.player_id = current_player.id
  rescue ActiveRecord::RecordNotFound => e
    redirect_to my_games_path
    flash[:alert] = "Access denied sucker! You did not play this game!"
  end

  private

  def game_params
    params.require(:game).permit(:game_type_id, :player_score, :opponent_score, :opponent_id)
  end
end
