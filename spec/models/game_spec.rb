require 'spec_helper'

describe Game do

  describe "validations" do

    subject { create(:game) }

    describe "game_type_id" do
      it 'must be present' do
        subject.game_type_id = nil
        expect(subject).to_not be_valid
      end
    end

    describe "player_score" do
      it 'must be present' do
        subject.player_score = nil
        expect(subject).to_not be_valid
      end
    end

    describe "player_id" do
      it 'must be present' do
        subject.player_id = nil
        expect(subject).to_not be_valid
      end
    end

    describe "opponent_score" do
      it 'must be present' do
        subject.opponent_score = nil
        expect(subject).to_not be_valid
      end
    end

    describe "opponent_id" do
      it 'must be present' do
        subject.opponent_id = nil
        expect(subject).to_not be_valid
      end
    end

  end

  describe "#calculate_winner" do

    subject { create(:game) }
    
    it "assigns the result to winner_id" do
      expect(subject.calculate_winner).to eq subject.winner_id
    end

    it "returns the winning player's player_id" do
      sam = create(:player)
      james = create(:opponent)
      game = create(:game, player_id: sam.id, player_score: 1, opponent_id: james.id, opponent_score: 0)
      expect(game.calculate_winner).to eq sam.id
    end

  end

  describe "#winner" do
    
    let(:sam) { create(:player) }
    let(:james) { create(:opponent) }
    subject { create(:game, player_score: 2, opponent_score: 0, player_id: sam.id, opponent_id: james.id) }

    it "returns the winning player" do
      expect(subject.winner).to eq sam
    end
  end

  describe "#create_scores" do

    subject { create(:game) }

    it "creates new scores" do
      expect(subject).to have(2).scores
    end

  end

  describe "#player_score" do

    subject { create(:game, player_score: 3) }

    it "retrieves the current player's score" do
      expect(subject.player_score).to eq 3
    end
  end

  describe "#opponent_score" do
    
    subject { create(:game, opponent_score: 10) }

    it "retrieves the opponent's score" do
      expect(subject.opponent_score).to eq 10
    end

  end

end
