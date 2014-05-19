require 'spec_helper'

describe DashboardHelper do

  describe "#format_league_position" do
    context 'when position is nil' do
      it "returns 'You haven\'t played any games in this league yet!'" do
        expect(helper.format_league_position(nil)).to eq "You haven't played any games in this league yet!"
      end
    end
    context 'when position ends in 1 except for 11' do
      it "appends 'st' to position" do
        expect(helper.format_league_position(1)).to eq "1st"
        expect(helper.format_league_position(21)).to eq "21st"
      end
    end

    context 'when position ends in 0, 4, 5, 6, 7, 8, 9 or is 11' do
      it "it appends 'th' to position" do
        expect(helper.format_league_position(4)).to eq "4th"
        expect(helper.format_league_position(5)).to eq "5th"
        expect(helper.format_league_position(6)).to eq "6th"
        expect(helper.format_league_position(7)).to eq "7th"
        expect(helper.format_league_position(8)).to eq "8th"
        expect(helper.format_league_position(9)).to eq "9th"
        expect(helper.format_league_position(10)).to eq "10th"
        expect(helper.format_league_position(11)).to eq "11th"
      end
    end

    context 'when position ends in 2' do
      it "appends 'nd' to position" do
        expect(helper.format_league_position(2)).to eq "2nd"
        expect(helper.format_league_position(42)).to eq "42nd"
      end
    end

    context 'when position ends in 3' do
      it "appends 'rd' to position" do
        expect(helper.format_league_position(3)).to eq "3rd"
        expect(helper.format_league_position(133)).to eq "133rd"
      end
    end
  end

end
