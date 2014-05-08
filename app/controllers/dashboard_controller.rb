class DashboardController < ApplicationController

  before_action :authenticate_player!

  def index
    @game = Game.new
  end

  def my_games
    @games = current_player.games
  end
end
