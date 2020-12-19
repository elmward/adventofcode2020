require_relative './part1.rb'

describe 'in_ranges?' do
  it "is true if the value is in one of the given ranges" do
    expect(in_ranges?(12, (1..4), (7..12), (50..75))).to eq true
  end

  it "is false if the value is not one of the given ranges" do
    expect(in_ranges?(13, (1..4), (7..12), (50..75))).to eq false
  end
end
