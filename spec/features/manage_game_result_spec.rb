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

  scenario "view games result history on 'My Games' page" do
    
    visit '/dashboard'
    fill_in :player_email, with: "sam.johnson@fundingcircle.com"
    fill_in :player_password, with: "password"
    click_button "Sign in"

    select "FIFA 14", from: :game_game_type_id
    select "James Cook", from: :game_opponent_id 
    fill_in :game_player_score, with: 2
    fill_in :game_opponent_score, with: 3

    click_button "Add Result"

    select "FIFA 14", from: :game_game_type_id
    select "James Cook", from: :game_opponent_id 
    fill_in :game_player_score, with: 2
    fill_in :game_opponent_score, with: 1

    click_button "Add Result"

    click_link('#my-games')

    expect(page).to have_content "My Games"
    expect(page).to have_content "FIFA 14"
    expect(page).to have_content "Sam Johnson 2 - 3 James Cook"
    expect(page).to have_content "Sam Johnson 2 - 1 James Cook"
  end

  scenario "edit game result from the 'My Games' page" do
    
    visit '/dashboard'
    fill_in :player_email, with: "sam.johnson@fundingcircle.com"
    fill_in :player_password, with: "password"
    click_button "Sign in"

    select "FIFA 14", from: :game_game_type_id
    select "James Cook", from: :game_opponent_id 
    fill_in :game_player_score, with: 2
    fill_in :game_opponent_score, with: 3

    click_button "Add Result"

    click_link('#my-games')
  end

end