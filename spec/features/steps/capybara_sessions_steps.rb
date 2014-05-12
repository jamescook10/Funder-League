module SessionSteps
  def login_player(player)
    ensure_on new_player_session_path
    
    fill_in :player_email, with: player.email
    fill_in :player_password, with: player.password
    click_button "Sign in"
  end
end