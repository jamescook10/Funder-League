require './app/helpers/application_helper'
include ApplicationHelper

class DashboardPresenter

  def initialize(current_player)
    @game_types = GameType.all
    @current_player = current_player
  end

  def count_games_played_for_all_games
    games_played = {games_played: {} }
    @game_types.each do |game_type|
      game_type_name = underscore_case(game_type.name).to_sym
      games_played[:games_played][game_type_name] = { value: @current_player.count_games_for(game_type), color: game_type.color }
    end
    return games_played
  end

  def win_percentages_for_chart(game_type)
    percentages = {percentages: {} }
    win = @current_player.count_wins_for(game_type)
    draw = @current_player.count_draws_for(game_type)
    lose = @current_player.count_losses_for(game_type)
    total = win + draw + lose
    win_percentage = (win / total.to_f) * 100
    lose_percentage = (lose / total.to_f) * 100
    draw_percentage = 100 - win_percentage - lose_percentage
    percentages[:percentages][:win] = { value: win_percentage, color: darken_color(game_type.color, 0.8) }
    percentages[:percentages][:draw] = { value: draw_percentage, color:  game_type.color }
    percentages[:percentages][:lose] = { value: lose_percentage, color: lighten_color(game_type.color, 0.2) }
    percentages
  end

  def list_opponents
    players = Player.all
    opponents = players - [@current_player]
    opponents.each do |player|
      player.first_name = player.first_name.capitalize
      player.last_name = player.last_name.capitalize
    end
    opponents
  end

  def darken_color(hex_color, amount=0.4)
    hex_color = hex_color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = (rgb[0].to_i * amount).round
    rgb[1] = (rgb[1].to_i * amount).round
    rgb[2] = (rgb[2].to_i * amount).round
    "#%02x%02x%02x" % rgb
  end
    
  # Amount should be a decimal between 0 and 1. Higher means lighter
  def lighten_color(hex_color, amount=0.6)
    hex_color = hex_color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = [(rgb[0].to_i + 255 * amount).round, 255].min
    rgb[1] = [(rgb[1].to_i + 255 * amount).round, 255].min
    rgb[2] = [(rgb[2].to_i + 255 * amount).round, 255].min
    "#%02x%02x%02x" % rgb
  end
end