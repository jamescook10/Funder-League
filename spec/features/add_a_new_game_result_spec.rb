feature 'Games' do
  scenario 'add a new result from the user dashboard' do
    visit '/players/1/dashboard'
    fill_in :game_opponent, with: "Sam Johnson"
    fill_in :game_player_score, with: 2
    fill_in :game_opponent_score, with: 3
    select "FIFA 14", from: :game_type

    click_button "Add Result"

    expect(page).have_content "New result added!"
  end
end