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

  describe "#full_name" do
    subject { create(:player) }

    it "returns the player's full name" do
      expect(subject.full_name).to eq "Sam Johnson"
    end
  end

  describe "#possessive_form" do

    context "when string doesn't end in an 's'" do
      subject { create(:player) }
      it "returns a string with an apostrophe and an 's' at the end" do
        expect(subject.possessive_form(subject.first_name)).to eq "Sam's"
      end
    end

    context "when string ends in an s" do
      subject { create(:opponent) }
      it "returns a string with an apostrophe at the end" do
        expect(subject.possessive_form(subject.first_name)).to eq "James'"
      end
    end
    
  end
  
end
