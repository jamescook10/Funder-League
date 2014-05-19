require 'spec_helper'

describe GameType do

  describe "#players" do

    subject { create(:game_type) }
    let!(:players) { FactoryGirl.create_list(:player, 5) }
    let!(:game1) { create(:game, game_type: subject, player_id: players[0].id, opponent_id: players[1].id, player_score: 3, opponent_score: 1) }
    let!(:game2) { create(:game, game_type: subject, player_id: players[0].id, opponent_id: players[4].id, player_score: 2, opponent_score: 3) }
    let!(:game3) { create(:game, game_type: subject, player_id: players[3].id, opponent_id: players[2].id, player_score: 1, opponent_score: 0) }
    let!(:game4) { create(:game, game_type: subject, player_id: players[2].id, opponent_id: players[1].id, player_score: 4, opponent_score: 2) }
    let!(:game5) { create(:game, game_type: subject, player_id: players[3].id, opponent_id: players[4].id, player_score: 2, opponent_score: 1) }

  
    it "returns an array of players who have played a game belonging to the GameType" do
      expect(subject.players).to match_array players
    end
  end

  describe "#sort_players_by_win_percentage" do

    let(:player1) { double("Player 1", win_percentage_for: 10.0) }
    let(:player2) { double("Player 2", win_percentage_for: 50.0) }
    let(:player3) { double("Player 3", win_percentage_for: 30.0) }
    let(:player_array) { [player1, player2, player3] } 

    it "returns an array of players sorted by win percentage" do
      subject.stub(:players).and_return(player_array)
      expect(subject.sort_players_by_win_percentage).to eq [player2, player3, player1]
    end
    
  end
end
