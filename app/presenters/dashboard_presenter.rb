class DashboardPresenter

  def initialize(current_player)
    @game_types = GameType.all
    @current_player = current_player
  end

  def count_wins_for_all_games
    wins = {games_played: {} }
    @game_types.each do |game_type|
      game_type_name = game_type.name.downcase.tr(' ', '_').to_sym
      wins[:games_played][game_type_name] = { value: @current_player.count_wins_for(game_type), color: game_type.color }
    end
    return wins
  end

  def list_opponents
    opponents = Player.all
    opponents - [@current_player]
  end
end