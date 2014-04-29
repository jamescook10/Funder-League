require 'spec_helper'

describe Game do

  describe "validations" do

    subject { create(:game) }

    describe "winner_id" do

      context "when blank" do
        it 'is not valid' do
          subject.stub(:winner_id).and_return(nil)
          expect(subject).to_not be_valid
        end
      end

      context "when not blank" do
        it "is valid" do
          expect(subject).to be_valid
        end
      end
    end
  end

  describe "#calculate_winner" do

    let(:fifa) { create(:game_type) }
    subject { create(:game) }
    
    it "assigns the winning player to winner_id" do
      expect(subject.calculate_winner).to eq subject.winner_id
    end

  end

end
