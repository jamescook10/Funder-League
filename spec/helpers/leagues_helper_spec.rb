require 'spec_helper'

describe LeaguesHelper do
  describe "formatting" do
    describe "percentage_format" do
      it "displays a value as a percentage" do
        expect(percentage_format(5)).to eq "5.00%" 
      end
    end
  end
  
end
