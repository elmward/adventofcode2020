require_relative './part1.rb'

describe 'next_number' do
  it 'is zero if the last number is new' do
    expect(next_number([0, 3, 6])).to eq 0
  end

  it 'is the age of the last number if it is old' do
    expect(next_number([0, 3, 6, 0])).to eq 3
  end
end
