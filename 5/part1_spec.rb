require_relative './part1.rb'

describe "row" do
  it "determines the correct row" do
    expect(row("FBFBBFF")).to eq 44
    expect(row("BFFFBBF")).to eq 70
    expect(row("FFFBBBF")).to eq 14
    expect(row("BBFFBBF")).to eq 102
  end
end

describe "column" do
  it "determines the correct column" do
    expect(column("RLR")).to eq 5
    expect(column("RRR")).to eq 7
    expect(column("RLL")).to eq 4
  end
end

describe "seat_id" do
  it "calculates the unique seat id" do
    expect(seat_id("FBFBBFFRLR")).to eq 357
    expect(seat_id("BFFFBBFRRR")).to eq 567
    expect(seat_id("FFFBBBFRRR")).to eq 119
    expect(seat_id("BBFFBBFRLL")).to eq 820
  end
end
