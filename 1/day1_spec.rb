require_relative './day1'

RSpec.describe ('day 1') do
  let (:input) { %w[1721 979 366 299 675 1456] }

  describe "#audit" do
    it "multiplies the pair that sums to 2020" do
      expect(audit(input)).to eq 514579
    end
  end

  describe "#audit3" do
    it "multiplies the triple that sums to 2020" do
      expect(audit3(input)).to eq 241861950
    end
  end
end
