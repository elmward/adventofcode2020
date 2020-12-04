require_relative './part1.rb'

describe 'Slope' do
  let (:input) do
    <<~HERE
    ..##.......
    #...#...#..
    .#....#..#.
    ..#.#...#.#
    .#...##..#.
    ..#.##.....
    .#.#.#....#
    .#........#
    #.##...#...
    #...##....#
    .#..#...#.#
    HERE
  end

  subject { Slope.new(input.split("\n").map(&:chars)) }

  describe "#move_hits?" do
    it "finds a hit inside the currrent iteration of the slope" do
      expect(subject.move_hits?(0, 0, 4, 1)).to eq true
    end

    it "finds a miss inside the current iteration of the slope" do
      expect(subject.move_hits?(0, 0, 3, 1)).to eq false
    end

    it "finds a hit when you go off the right edge of the map" do
      expect(subject.move_hits?(0, 0, 11, 1)).to eq true
    end
  end

  describe "#num_hits" do
    it "calculates the number of tree hits for a given starting point and slope" do
      expect(subject.num_hits(0, 0, 3, 1)).to eq 7
    end
  end
end
