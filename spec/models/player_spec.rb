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
    
  end
  
end
