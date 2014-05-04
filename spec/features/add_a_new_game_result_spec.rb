require 'spec_helper'

feature 'Games' do

  before(:each) do
    create(:player)
    create(:opponent)
    create(:game_type)
  end

  scenario 'add a new result from the user dashboard' do

    visit '/dashboard'
    fill_in :player_email, with: "sam.johnson@fundingcircle.com"
    fill_in :player_password, with: "password"
    click_button "Sign in"

    select "FIFA 14", from: :game_game_type_id
    select "James Cook", from: :game_opponent_id 
    fill_in :game_player_score, with: 2
    fill_in :game_opponent_score, with: 3

    click_button "Add Result"

    expect(page).to have_content "New result added!"
  end
end