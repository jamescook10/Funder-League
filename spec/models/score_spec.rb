require 'spec_helper'

describe Score do
  describe "validations" do

    subject { create(:score) }

    describe "player_id" do

      it "must be present" do
        subject.player_id = nil
        expect(subject).to_not be_valid
      end
    end

    describe "game_id" do
      it "must be present" do
        subject.game_id = nil
        expect(subject).to_not be_valid
      end
    end

    describe "value" do
      it "must be present" do
        subject.value = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe ".ordered_for_player" do
    
    let(:sam) { create(:player) }
    let(:game) { create(:game, player_id: sam.id) }
    subject { game.scores }

    it "returns all scores for the game" do
      expect(subject.ordered_for_player(sam)).to match_array subject
    end
    
    it "orders the scores by player" do
      expect(subject.ordered_for_player(sam).first.player_id).to eq sam.id
    end

  end
end
