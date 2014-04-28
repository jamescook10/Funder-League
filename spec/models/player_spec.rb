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
  
end
