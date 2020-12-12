require_relative './part1.rb'

context "with the sample input" do
  let(:input) do
    <<~HERE
    L.LL.LL.LL
    LLLLLLL.LL
    L.L.L..L..
    LLLL.LL.LL
    L.LL.LL.LL
    L.LLLLL.LL
    ..L.L.....
    LLLLLLLLLL
    L.LLLLLL.L
    L.LLLLL.LL
    HERE
  end

  let(:seat_map) { input.split("\n").map { |row| row.chars } }

  describe 'iterate' do
    it "performs a single iteration" do
      nxt, modified = iterate(seat_map)
      expect(nxt.map { |row| row.count { |seat| seat == 'L' } }.sum).to eq 0
    end
  end

  describe 'iterate_until_stable' do
    it "runs the game until it's stable" do
      final = iterate_until_stable(seat_map)
      expect(final.map { |row| row.count { |seat| seat == "#" } }.sum).to eq 37
    end
  end

  describe "adjacencies" do
    it "deals correctly with a middle seat" do
      adj = adjacencies(3, 2, seat_map)
      expect(adj.count { |seat| seat == EMPTY }).to eq 7
      expect(adj.count { |seat| seat == FLOOR }).to eq 1
      expect(adj.count { |seat| seat == OCCUPIED }).to eq 0
    end

    it "deals correctly with a corner seat" do
      adj = adjacencies(0, 9, seat_map)
      expect(adj.count { |seat| seat == EMPTY }).to eq 1
      expect(adj.count { |seat| seat == FLOOR }).to eq 2
      expect(adj.count { |seat| seat == OCCUPIED }).to eq 0
    end

    it "deals correctly with an edge seat" do
      adj = adjacencies(9, 4, seat_map)
      expect(adj.count { |seat| seat == EMPTY }).to eq 5
      expect(adj.count { |seat| seat == FLOOR }).to eq 0
      expect(adj.count { |seat| seat == OCCUPIED }).to eq 0
    end
  end
end

