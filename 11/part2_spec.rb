require_relative './part2.rb'

describe "iterate_until_stable" do
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

  it "whatever" do
    cur = iterate_until_stable(seat_map)
    expect(cur.map{ |row| row.count { |seat| seat == OCCUPIED } }.sum).to eq 26
  end
end
