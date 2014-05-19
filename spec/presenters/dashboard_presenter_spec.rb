require 'spec_helper'

describe DashboardPresenter do

  subject { DashboardPresenter.new(player) }

  let!(:player) { create(:player) }
  let!(:opponent) { create(:player) }

  describe '#count_games_played_for_all_games' do

    let!(:fifa) { create(:game_type, name: "FIFA", color: "#000000") }
    let!(:pool) { create(:game_type, name: "Pool", color: "#000000") }
    let!(:game1) { create(:game, game_type: fifa, player_id: player.id, player_score: 2, opponent_id: opponent.id, opponent_score: 0) }
    let!(:game2) { create(:game, game_type: fifa, player_id: player.id, player_score: 2, opponent_id: opponent.id, opponent_score: 0) }
    let!(:game3) { create(:game, game_type: fifa, player_id: player.id, player_score: 2, opponent_id: opponent.id, opponent_score: 0) }
    let!(:game4) { create(:game, game_type: pool, player_id: player.id, player_score: 2, opponent_id: opponent.id, opponent_score: 0) }

    it 'returns a hash of values' do
      expect(subject.count_games_played_for_all_games).to be_a Hash
    end

    it 'returns the correct amount of wins for each game' do
      expect(subject.count_games_played_for_all_games).to eq({games_played: {fifa: {value: 3, color:"#000000"}, pool: {value: 1, color: "#000000"}}})
    end

  end

  describe '#list_opponents' do
    it 'lists all players except current player' do
      expect(subject.list_opponents).to_not include(player)
      expect(subject.list_opponents).to include(opponent)
    end

    it 'does not destructively delete current player' do
      subject.list_opponents
      expect(Player.all).to include(player)
    end
  end
end