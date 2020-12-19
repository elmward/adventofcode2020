require_relative './part2.rb'

describe 'process_rules' do
  let (:input) do
    <<~HERE
    class: 0-1 or 4-19
    row: 0-5 or 8-19
    seat: 0-13 or 16-19
    HERE
  end

  it 'returns ranges keyed by rule name' do
    expect(process_rules(input)).to eq({
      "class" => [(0..1), (4..19)],
      "row" => [(0..5), (8..19)],
      "seat" => [(0..13), (16..19)],
    })
  end
end

describe 'eligible_rules' do
  let (:rules) do
    {
      "class" => [(0..1), (4..19)],
      "row" => [(0..5), (8..19)],
      "seat" => [(0..13), (16..19)],
    }
  end

  context 'with a single value' do
    it 'returns the rules the given values matches' do
      expect(eligible_rules(3, rules)).to eq ["row", "seat"]
      expect(eligible_rules(15, rules)).to eq ["class", "row"]
      expect(eligible_rules(7, rules)).to eq ["class", "seat"]
    end
  end

  context 'with an array of values' do
    it 'returns the rules that all the given values match' do
      expect(eligible_rules([3, 15, 5], rules)).to eq ["row"]
    end

    it 'returns an empty array if no rule matches all values' do
      expect(eligible_rules([6, 13, 25], rules)).to eq []
    end
  end
end
