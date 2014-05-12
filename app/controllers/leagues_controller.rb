class LeaguesController < ApplicationController

	def index
	end

  def show
    @game_type = GameType.find_by_name(params[:name])
  end
end
