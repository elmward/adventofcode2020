require_relative './part2.rb'

describe "count_answers" do
  let (:group) do
    <<~HERE
    ab
    ac
    HERE
  end

  it "counts all the questions that everyone answered 'yes' to" do
    expect(count_answers(group)).to eq 1
  end
end
