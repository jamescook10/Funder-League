require "./app/presenters/dashboard_presenter"

class DashboardController < ApplicationController

  before_action :authenticate_player!

  def index
    @game = Game.new
    @game_types = GameType.all
    @player_data = DashboardPresenter.new(current_player)
  end 

end
