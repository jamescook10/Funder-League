module SessionSteps
  def login_player
    params = attributes_for(:player)
    ensure_on new_player_session_path
    
    fill_in :player_email, with: params[:email]
    fill_in :player_password, with: params[:password]
    click_button "Sign in"
  end
end