require 'spec_helper'
include SessionSteps
include CommonSteps
include GameSteps

feature 'Games' do

  before(:each) do
    create(:player)
    create(:opponent)
    create(:game_type)
  end

  scenario 'add a new result from the user dashboard' do
    login_player
    ensure_on dashboard_path
    create_game({ game_type: "FIFA 14", opponent: "James Cook", player_score: 1, opponent_score: 2 })
    expect(page).to have_content "New result added!"
  end

  scenario "view games result history on 'My Games' page" do
    login_player
    ensure_on dashboard_path
    create_game({ game_type: "FIFA 14", opponent: "James Cook", player_score: 1, opponent_score: 2 })
    create_game({ game_type: "FIFA 14", opponent: "James Cook", player_score: 3, opponent_score: 1 })

    click_link('my-games')

    expect(page).to have_content "My Games"
    expect(page).to have_content "FIFA 14"
    expect(page).to have_content "1 Sam Johnson VS 2 James Cook"
    expect(page).to have_content "3 Sam Johnson VS 1 James Cook"
  end

  scenario "edit game result from the 'My Games' page" do
    
    login_player
    ensure_on dashboard_path
    create_game({ game_type: "FIFA 14", opponent: "James Cook", player_score: 3, opponent_score: 2 })

    ensure_on my_games_path
    expect(page).to have_content "My Games"

    click_link("Edit Result")

    fill_in :game_player_score, with: 3
    fill_in :game_opponent_score, with: 0

    click_button "Save Game"

    expect(page).to have_content "Game successfully updated"
    expect(page).to have_content "Sam Johnson 3 - 0 James Cook"
  end

end