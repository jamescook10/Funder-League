module GameSteps

  def create_game(opts)
    select opts[:game_type], from: :game_game_type_id
    select opts[:opponent], from: :game_opponent_id 
    fill_in :game_player_score, with: opts[:player_score]
    fill_in :game_opponent_score, with: opts[:opponent_score]

    click_button "Add Result"
  end

end