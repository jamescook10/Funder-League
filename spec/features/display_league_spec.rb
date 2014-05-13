require 'spec_helper'
include SessionSteps
include CommonSteps
include GameSteps

feature "Leagues" do

  let!(:fifa) { create(:game_type, name: "FIFA") }
  let!(:pool) { create(:game_type, name: "Pool") }
  let!(:table_tennis) { create(:game_type, name: "Table Tennis") }
  let!(:table_football) { create(:game_type, name: "Table Football") }
  let!(:players) { FactoryGirl.create_list(:player, 5) }
  let!(:game1) { create(:game, game_type: fifa, player_id: players[0].id, opponent_id: players[1].id, player_score: 3, opponent_score: 1) }
  let!(:game2) { create(:game, game_type: fifa, player_id: players[0].id, opponent_id: players[4].id, player_score: 2, opponent_score: 3) }
  let!(:game3) { create(:game, game_type: fifa, player_id: players[3].id, opponent_id: players[2].id, player_score: 1, opponent_score: 0) }
  let!(:game4) { create(:game, game_type: fifa, player_id: players[2].id, opponent_id: players[1].id, player_score: 4, opponent_score: 2) }
  let!(:game5) { create(:game, game_type: fifa, player_id: players[3].id, opponent_id: players[4].id, player_score: 2, opponent_score: 1) }

  scenario "view league" do
    ensure_on league_path(fifa.name)
    expect(page).to have_content "Player Name Played Win Draw Lose Win%"
    expect(page).to have_content players[0].full_name
    expect(page).to have_content players[1].full_name
    expect(page).to have_content players[2].full_name
    expect(page).to have_content players[3].full_name
    expect(page).to have_content players[4].full_name
  end

  scenario "view league index" do
    ensure_on leagues_path
    expect(page).to have_content "FIFA"
    expect(page).to have_content "Pool"
    expect(page).to have_content "Table Tennis"
    expect(page).to have_content "Table Football"
  end


end