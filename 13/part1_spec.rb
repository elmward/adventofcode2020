require_relative './part1.rb'

describe 'day 13 part 1' do
  describe 'earliest departure' do
    it 'calculates the earliest time you could leave on a given bus ID' do
      [[7, 945], [13, 949], [59, 944], [31, 961], [19, 950]].each do |bus_id, time|
        expect(earliest_departure(939, bus_id)).to eq(time)
      end
    end
  end
end
