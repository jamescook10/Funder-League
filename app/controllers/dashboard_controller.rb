class DashboardController < ApplicationController

  before_action :authenticate_player!

  def index
    @game = Game.new
  end

  def my_games
    
  end
end
