class DashboardController < ApplicationController

  before_action :authenticate_player!

  layout "dashboard"

  def index
    @game = Game.new
  end

end
