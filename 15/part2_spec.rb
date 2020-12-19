require_relative './part2.rb'

describe 'next_number' do
  it 'gives the next number given a number, a turn, and a hash of previous turns' do
    previous_turns = { 0 => 1, 3 => 2 }
    expect(next_number(turn: 3, num: 6, previous_turns: previous_turns)).to eq 0
  end

  it "whatever" do
    previous_turns = { 0 => 1, 3 => 2, 6 => 3 }
    expect(next_number(turn: 4, num: 0, previous_turns: previous_turns)).to eq 3
  end

  it "yeah" do
    previous_turns = { 0 => 3, 3 => 2, 6 => 3 }
    expect(next_number(turn: 5, num: 3, previous_turns: previous_turns)).to eq 3
  end

  it "woo" do
    previous_turns = { 0 => 3, 3 => 5, 6 => 3 }
    expect(next_number(turn: 6, num: 3, previous_turns: previous_turns)).to eq 1
  end
end
