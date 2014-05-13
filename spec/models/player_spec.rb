require 'spec_helper'

describe Player do

  it 'has a first name' do
    expect(subject).to respond_to :first_name
  end

  it 'has a last name' do
    expect(subject).to respond_to :last_name
  end

  it 'has a twitter field' do
    expect(subject).to respond_to :twitter
  end

  describe "validations" do

    subject { create(:player) }
    
    describe 'first name' do

      context 'when blank' do
        it 'is not valid' do
          subject.first_name = ""
          expect(subject).to_not be_valid
        end
      end

      context 'when not blank' do
        it 'is valid' do
          expect(subject).to be_valid
        end
      end
    end

    describe 'last name' do
      context 'when blank' do
        it 'is valid' do
          subject.last_name = ""
          expect(subject).to be_valid
        end
      end

      context 'when not blank' do
        it 'is valid' do
          expect(subject).to be_valid
        end
      end
    end

    describe 'email' do
      context 'when it ends in fundingcircle.com' do
        it 'is valid' do
          expect(subject).to be_valid
        end
      end

      context 'when it does not end in fundingcircle.com' do
        it 'is not valid' do
          subject.email = "shjohnson@me.com"
          expect(subject).to_not be_valid
        end
      end
    end

  end

  describe "players names" do
    subject { create(:player) }

    describe "#full_name" do
      it "returns the player's full name" do
        expect(subject.full_name).to eq subject.first_name + " " + subject.last_name
      end
    end

    describe "#possessive_form" do
      context "when string doesn't end in an 's'" do
        it "returns a string with an apostrophe and an 's' at the end" do
          subject.first_name = "Sam"
          expect(subject.possessive_form(subject.first_name)).to eq "Sam's"
        end
      end

      context "when string ends in an s" do
        it "returns a string with an apostrophe at the end" do
          subject.first_name = "James"
          expect(subject.possessive_form(subject.first_name)).to eq "James'"
        end
      end  
    end
  end

  describe "stats" do

    let(:fifa) { create(:game_type) }
    let(:sam) { create(:player) }
    let(:james) { create(:player) }

    before(:each) do
      create(:game, player_id: sam.id, opponent_id: james.id, player_score: 3, opponent_score: 1, game_type: fifa)
      create(:game, player_id: sam.id, opponent_id: james.id, player_score: 2, opponent_score: 3, game_type: fifa)
      create(:game, player_id: sam.id, opponent_id: james.id, player_score: 1, opponent_score: 1, game_type: fifa)
      create(:game, player_id: sam.id, opponent_id: james.id, player_score: 1, opponent_score: 1, game_type: fifa)
    end

    subject { sam }

    describe "win_percentage_for" do
      it "calculates the player's win percentage for the specified game type" do
        expect(subject.win_percentage_for(fifa)).to eq 25.0
      end
    end

    describe "count_games_for" do
      it "counts the number of games a player has played of the specified game type" do
        expect(subject.count_games_for(fifa)).to eq 4
      end
    end

    describe "count_wins_for" do
      it "counts the number of wins a player has of the specified game type" do
        expect(subject.count_wins_for(fifa)).to eq 1
      end
    end

    describe "count_draws_for" do
      it "counts the number of draws a player has of the specified game type" do
        expect(subject.count_draws_for(fifa)).to eq 2
      end
    end

    describe "count_losses_for" do
      it "counts the number of losses a player has of the specified game type" do
        expect(subject.count_losses_for(fifa)).to eq 1
      end
    end
  end
end
