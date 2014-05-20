class GamesController < ApplicationController
  
  before_action :authenticate_player!

  def index
    @games = current_player.games.includes(:game_type).order(created_at: :desc)
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

  def update
    @data = DashboardPresenter.new(current_player)
    @game_types = GameType.all
    begin
      @game = current_player.games.find(params[:id])
      @game.player_id = current_player.id
      if @game.update_attributes(game_params)
        redirect_to my_games_path
        flash[:success] = "Game result successfully updated"
      else
        render "games/edit"
      end
    rescue ActiveRecord::RecordNotFound => e
      redirect_to my_games_path
      flash[:alert] = "Access denied sucker! You did not play this game!"
    end
  end

  def destroy
    @game = current_player.games.find(params[:id])
    @game.destroy
    redirect_to my_games_path
    flash[:notice] = "Game result deleted"
  end

  private

  def game_params
    params.require(:game).permit(:game_type_id, :player_score, :opponent_score, :opponent_id)
  end
end
