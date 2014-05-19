require 'spec_helper'

describe ApplicationHelper do
  describe "formatting" do
    describe "percentage_format" do
      it "displays a value as a percentage" do
        expect(percentage_format(5)).to eq "5.00%" 
      end
    end

    describe 'css_case' do
      it 'downcases a string and replaces spaces with dashes' do
        expect(css_case("Table Tennis")).to eq "table-tennis"
      end
    end

    describe 'underscore_case' do
      it 'downcases a string and replaces spaces with underscores' do
        expect(underscore_case("Table Tennis")).to eq "table_tennis"
      end
    end
  end  
end