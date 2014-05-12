require 'spec_helper'
include SessionSteps
include CommonSteps
include GameSteps

feature "Leagues" do

  (1..5).each do |i|
    let!("player#{i}") { create(:player) }
  end

  scenario "view league" do
    ensure_on leagues_path
    expect(page).to have_content "Player Name Played Win Draw Lose Win%"
    expect(page).to have_content player1.full_name
    expect(page).to have_content player2.full_name
    expect(page).to have_content player3.full_name
    expect(page).to have_content player4.full_name
    expect(page).to have_content player5.full_name
  end


end