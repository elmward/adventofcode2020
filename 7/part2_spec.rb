require_relative './part2.rb'

describe "bags_contained" do
  context "with a simple rule" do
    let(:rules) do
      {
        "vibrant plum" => [],
        "faded blue" => [{num: 5, color: "vibrant plum"}],
      }
    end

    it "calculates the number of bags contained" do
      expect(bags_contained(rules, "faded blue")).to eq 5
    end
  end

  context "with a rule that allows two colored bags inside" do
    let(:rules) do
      {
        "vibrant plum" => [],
        "dark olive" => [],
        "faded blue" => [{num: 5, color: "vibrant plum"}, {num: 2, color: "dark olive"}],
      }
    end

    it "calculates the number of bags contained" do
      expect(bags_contained(rules, "faded blue")).to eq 7
    end
  end

  context "with rules that allow nesting" do
    let(:rules) do
      {
        "vibrant plum" => [],
        "dark olive" => [],
        "faded blue" => [{num: 5, color: "vibrant plum"}, {num: 2, color: "dark olive"}],
        "shiny gold" => [{num: 2, color: "faded blue"}, {num: 3, color: "vibrant plum"}],
      }
    end

    it "calculates the number of bags contained" do
      expect(bags_contained(rules, "shiny gold")).to eq 19
    end
  end

  context "with fuller rules" do
    let(:rules) do
      {
        "dark violet" => [],
        "shiny gold" => [{num: 2, color: "dark red"}],
        "dark red" => [{num: 2, color: "dark orange"}],
        "dark orange" => [{num: 2, color: "dark yellow"}],
        "dark yellow" => [{num: 2, color: "dark green"}],
        "dark green" => [{num: 2, color: "dark blue"}],
        "dark blue" => [{num: 2, color: "dark violet"}],
      }
    end

    it "calculates the numbers of bags contained in the given color" do
      expect(bags_contained(rules, "shiny gold")).to eq 126
    end
  end
end

describe "parse_rules" do
  let(:input) do
    <<~HERE
    light red bags contain 1 bright white bag, 2 muted yellow bags.
    dark orange bags contain 3 bright white bags, 4 muted yellow bags.
    bright white bags contain 1 shiny gold bag.
    muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
    shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
    dark olive bags contain 3 faded blue bags, 4 dotted black bags.
    vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
    faded blue bags contain no other bags.
    dotted black bags contain no other bags.
    HERE
  end

  let (:rules) do
    {
      "faded blue" => [],
      "dotted black" => [],
      "vibrant plum" => [{num: 5, color: "faded blue"}, {num: 6, color: "dotted black"}],
      "dark olive" => [{num: 3, color: "faded blue"}, {num: 4, color: "dotted black"}],
      "shiny gold" => [{num: 1, color: "dark olive"}, {num: 2, color: "vibrant plum"}],
      "muted yellow" => [{num: 2, color: "shiny gold"}, {num: 9, color: "faded blue"}],
      "bright white" => [{num: 1, color: "shiny gold"}],
      "dark orange" => [{num: 3, color: "bright white"}, {num: 4, color: "muted yellow"}],
      "light red" => [{num: 1, color: "bright white"}, {num: 2, color: "muted yellow"}],
    }
  end

  it "parses input to the expected rules" do
    expect(parse_input(input)).to eq rules
  end
end
