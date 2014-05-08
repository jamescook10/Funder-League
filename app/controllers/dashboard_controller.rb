class DashboardController < ApplicationController

  before_action :authenticate_player!

  layout "dashboard"

  def index
    @game = Game.new
  end

  def my_games
    @games = current_player.games
  end
end
