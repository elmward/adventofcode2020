require_relative './part1.rb'

describe "day 10" do
  let (:joltages) do
    %w[
    28
    33
    18
    42
    31
    14
    46
    20
    48
    47
    24
    23
    49
    45
    19
    38
    39
    11
    1
    32
    25
    35
    8
    17
    7
    9
    4
    2
    34
    10
    3
    ].map(&:to_i)
  end

  describe "joltage_differences" do
    it "builds a hash of differences" do
      expect(joltage_differences(joltages)).to eq({ 1 => 22, 3 => 10 })
    end
  end

  describe "valid_arrangements" do
    context "with simple input" do
      let(:joltages) { [0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19, 22] }
      it "calculates how many different arrangements are valid" do
        expect(valid_arrangements(joltages)).to eq 8
      end
    end

    it "calculates how many different arrangements are valid" do
      expect(valid_arrangements(joltages)).to eq 19208
    end
  end
end

