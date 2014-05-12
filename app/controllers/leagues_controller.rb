class LeaguesController < ApplicationController

	def index
    @game_types = GameType.all
	end

  def show
    @game_types = GameType.all
    @game_type = GameType.find_by_name(params[:name])
    @players = @game_type.players.includes(:games)
    @players.sort! do |a,b|
      b.win_percentage_for(@game_type) <=> a.win_percentage_for(@game_type) 
    end


  end
end
