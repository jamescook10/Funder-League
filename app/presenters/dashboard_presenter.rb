class DashboardPresenter

  attr_reader :current_player, :game_types, :games

  def initialize(current_player)
    @game_types = GameType.all
    @games = {}
    @current_player = current_player
    @win_percentages = self.win_percentages
    set_instance_variables
  end

  def set_instance_variables
    @game_types.each do |game_type|
      self.class.send(:define_method, game_type.name.parameterize.underscore) { instance_variable_set("@#{game_type.name.parameterize.underscore}", {}) }
      @games[game_type.name.parameterize.underscore.to_sym] = "@#{game_type.name.parameterize.underscore}"
    end
  end

  def position_in_league(game_type)
    league_table = sort_by_win_percentage(game_type.players, game_type)
    league_table.index(@current_player)
  end

  def win_percentages
    @win_percentages ||= self.calculate_win_percentages
  end

  def calculate_win_percentages
    win_percentages = {}
    @game_types.each do |game_type|
      win_percentages[game_type.name.parameterize] = @current_player.win_percentage_for(game_type)
    end
    win_percentages
  end

  def sort_by_win_percentage(players, game_type)
    players.sort do |a,b|
      b.win_percentage_for(game_type) <=> a.win_percentage_for(game_type) 
    end
  end

end