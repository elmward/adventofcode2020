require_relative './part1.rb'

describe "count_answers" do
  let (:group) do
    <<~HERE
    ab
    ac
    HERE
  end

  it "counts the number of answers a group said 'yes' to" do
    expect(count_answers(group)).to eq 3
  end
end
