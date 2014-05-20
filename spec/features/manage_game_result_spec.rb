require 'spec_helper'
include SessionSteps
include CommonSteps
include GameSteps

feature 'Games' do

  let!(:player) { create(:player) }
  let!(:opponent) { create(:player) }
  let!(:game_type) { create(:game_type) }

  before(:each) do
    login_player(player)
  end

  scenario 'add a new result from the user dashboard' do
    ensure_on dashboard_path
    create_game({ game_type: game_type.name, opponent: opponent.full_name, player_score: 1, opponent_score: 2 })
    expect(page).to have_content "New result added!"
  end

  scenario "view games result history on 'My Games' page" do
    ensure_on dashboard_path
    create_game({ game_type: game_type.name, opponent: opponent.full_name, player_score: 1, opponent_score: 2 })
    ensure_on dashboard_path
    create_game({ game_type: game_type.name, opponent: opponent.full_name, player_score: 3, opponent_score: 1 })

    click_link('my-games')

    expect(page).to have_content "My Games"
    expect(page).to have_content game_type.name
    expect(page).to have_content "1 #{player.full_name.capitalize} VS 2 #{opponent.full_name.capitalize}"
    expect(page).to have_content "3 #{player.full_name.capitalize} VS 1 #{opponent.full_name.capitalize}"
  end

  scenario "edit game result from the 'My Games' page" do
    
    ensure_on dashboard_path
    create_game({ game_type: game_type.name, opponent: opponent.full_name, player_score: 3, opponent_score: 2 })

    ensure_on my_games_path
    expect(page).to have_content "My Games"

    click_link("Edit")

    fill_in :game_player_score, with: 3
    fill_in :game_opponent_score, with: 0

    click_button "Save Result"

    expect(page).to have_content "Game result successfully updated"
    expect(page).to have_content "3 #{player.full_name.capitalize} VS 0 #{opponent.full_name.capitalize}"
  end

  scenario 'delete a game result' do
    ensure_on dashboard_path

    create_game({ game_type: game_type.name, opponent: opponent.full_name, player_score: 3, opponent_score: 2 })

    ensure_on my_games_path
    expect(page).to have_content "My Games"

    click_link("Delete")

    expect(page).to have_content "Game result deleted"
    expect(page).to_not have_content "3 #{player.full_name} VS 2 #{opponent.full_name}"
  end

end