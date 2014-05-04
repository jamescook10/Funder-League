class DashboardController < ApplicationController

  before_action :authenticate_player!

  def show
    @game = Game.new
  end
end
