require 'spec_helper'

feature 'Games' do

  let(:player) { create(:player) }

  scenario 'add a new result from the user dashboard' do

    visit '/dashboard'

    fill_in :player_email, with: "sam.johnson@fundingcircle.com"
    fill_in :player_password, with: "password"
    click_button "Sign in"

    fill_in :game_opponent, with: "James Cook"
    fill_in :game_player_score, with: 2
    fill_in :game_opponent_score, with: 3
    select "FIFA 14", from: :game_type

    click_button "Add Result"

    expect(page).have_content "New result added!"
  end
end