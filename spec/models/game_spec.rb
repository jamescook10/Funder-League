require 'spec_helper'

describe Game do

  describe "validations" do

    subject { build(:game) }

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

    context "when the game was tied" do

      subject { create(:game, player_score: 1, opponent_score: 1) }
      it "returns nil" do
        expect(subject.calculate_winner).to eq nil
      end
    end

  end

  describe ".winner" do
    
    let(:sam) { create(:player) }
    let(:james) { create(:opponent) }
    subject { create(:game, player_score: 2, opponent_score: 0, player_id: sam.id, opponent_id: james.id) }

    it "returns the winning player" do
      expect(subject.winner).to eq sam
    end

    context "when the game was tied" do
      subject { create(:game, player_score: 1, opponent_score: 1) }
      it "returns nil" do
        expect(subject.winner).to eq nil
      end
    end
  end

  describe ""

  describe "#create_scores" do

    subject { create(:game) }

    it "creates new scores" do
      expect(subject).to have(2).scores
    end

  end

  describe "reading scores" do

    let(:sam) { create(:player) }
    let(:james) { create(:opponent) } 

    context "when a new game" do

      subject { build(:game, player_id: sam.id, player_score: "2", opponent_id: james.id, opponent_score: "10") }

      describe "#player_score" do
        it "displays the current player's score" do
          expect(subject.player_score).to eq "2"
        end 
      end

      describe "#opponent_score" do
        it "displays the opponent's score" do
          expect(subject.opponent_score).to eq "10"
        end
      end
    end

    context "from an existing game" do

      let(:game) { create(:game, player_id: sam.id, player_score: 2, opponent_id: james.id, opponent_score: 10) }
      subject { Game.find(game.id) }

      # Setting the current player which will be set in the controller.
      before(:each) do
        subject.player_id = sam.id 
      end

      describe "#player_score" do
        it "retrieves the current player's score" do
          expect(subject.player_score).to eq "2"
        end
      end

      describe "#opponent_score" do
        it "retrieves the opponent's score" do
          expect(subject.opponent_score).to eq "10"
        end
      end
    end
  end

  

end
