require_relative './part2.rb'

describe 'day 13 part 2' do
  let(:input) do
    "7,13,x,x,59,x,31,19".split(',')
  end

  describe 'bus_schedule' do
    it 'returns a list of the offsets required by the input' do
      expect(bus_schedule(input)).to eq([
        [7, 0],
        [13, 1],
        [59, 4],
        [31, 6],
        [19, 7],
      ])
    end
  end

  describe 'find_first_valid_departure' do
    it 'simplest input' do
      schedule = [[2, 0], [3, 1], [5, 2]]
      expect(find_first_valid_departure(schedule)).to eq 8
    end

    it 'finds the minimum departure time that matches the required schedule' do
      schedule = bus_schedule(input)
      expect(find_first_valid_departure(schedule)).to eq 1068781
    end

    it 'other examples' do
      [
        ["17,x,13,19", 3417],
        ["67,7,59,61", 754018],
        ["67,x,7,59,61", 779210],
        ["67,7,x,59,61", 1261476],
      ].each do |input, expected|
        schedule = bus_schedule(input.split(','))
        expect(find_first_valid_departure(schedule)).to eq expected
      end
    end
  end
end
