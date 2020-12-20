require_relative './part1.rb'

describe 'day 17 part 1' do
  let(:active_points) do
    {
      Point.new(1, 0, 0) => '#',
      Point.new(2, 1, 0) => '#',
      Point.new(0, 2, 0) => '#',
      Point.new(1, 2, 0) => '#',
      Point.new(2, 2, 0) => '#',
    }
  end

  describe 'adjacencies' do
    let(:active_points) do
      {
        Point.new(1, 0, 0) => '#',
        Point.new(2, 1, 0) => '#',
        Point.new(0, 2, 0) => '#',
        Point.new(1, 2, 0) => '#',
        Point.new(2, 2, 0) => '#',
      }
    end

    it 'returns correct adjacenies for an inactive point at the top left' do
      expect(adjacencies(0,0,0, active_points)).to eq 1
    end

    it 'returns correct adjacencies for an active point at the bottom right' do
      expect(adjacencies(2, 2, 0, active_points)).to eq 2
    end
  end

  describe 'iterate' do
    it 'changes state for a single cycle' do
      expected_points = [
        [0, 1, -1],
        [2, 2, -1],
        [1, 3, -1],
        [0, 1, 0],
        [2, 1, 0],
        [1, 2, 0],
        [2, 2, 0],
        [1, 3, 0],
        [0, 1, 1],
        [2, 2, 1],
        [1, 3, 1],
      ].map { |pt| Point.new(*pt) }

      expect(iterate(active_points).keys).to match_array(expected_points)
    end
  end
end
