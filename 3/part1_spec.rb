require_relative './part1.rb'

describe "functional solution" do
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

  describe "prepare_map" do
    it "splits the map into an array of arrays" do
      tree_map = prepare_map(input)
      expect(tree_map).to be_an Array
      expect(tree_map.count).to eq 11
      expect(tree_map.map(&:count)).to all(eq 11)
      tree_map.each do |row|
        row.each do |point|
          expect(['#', '.']).to include(point)
        end
      end
    end
  end

  describe "select_rows" do
    let(:tree_map) { prepare_map(input) }

    it "selects the rows that our y-velocity will take us to" do
      expect(select_rows(1, tree_map).count).to eq 10
      expect(select_rows(5, tree_map).count).to eq 2
      expect(select_rows(10, tree_map).count).to eq 1
      expect(select_rows(10, tree_map)).to eq [tree_map.last]
    end
  end

  describe "count_trees" do
    let(:tree_map) { prepare_map(input) }

    it "counts the number of trees hit along a path" do
      expect(count_trees(3, 1, tree_map)).to eq 7
    end
  end
end
