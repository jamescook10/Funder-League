class LeaguesController < ApplicationController

  def index
    @game_types = GameType.all
  end

  def show
    @game_types = GameType.all
    @game_type = GameType.find_by_name(params[:name])
    @players = @game_type.players.includes(:games)
    @sorted_players = @game_type.sort_players_by_win_percentage
  end
  
end
