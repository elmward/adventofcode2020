require_relative './part1.rb'

describe "contains?" do
  let (:rules) do
    {
      "faded blue" => [],
      "dotted black" => [],
      "vibrant plum" => ["faded blue", "dotted black"],
      "dark olive" => ["faded blue", "dotted black"],
      "shiny gold" => ["dark olive", "vibrant plum"],
      "muted yellow" => ["shiny gold", "faded blue"],
      "bright white" => ["shiny gold"],
      "dark orange" => ["bright white", "muted yellow"],
      "light red" => ["bright white", "muted yellow"],
    }
  end

  it "is true if the given container color can immediately contain the given color" do
    expect(contains?(rules, "light red", "bright white")).to eq true
    expect(contains?(rules, "light red", "muted yellow")).to eq true
  end

  it "is true if the given container color transitively contains the given color" do
    expect(contains?(rules, "light red", "shiny gold")).to eq true
  end

  it "is false if the given container color can't contain anything" do
    expect(contains?(rules, "faded blue", "anything")).to eq false
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
      "vibrant plum" => ["faded blue", "dotted black"],
      "dark olive" => ["faded blue", "dotted black"],
      "shiny gold" => ["dark olive", "vibrant plum"],
      "muted yellow" => ["shiny gold", "faded blue"],
      "bright white" => ["shiny gold"],
      "dark orange" => ["bright white", "muted yellow"],
      "light red" => ["bright white", "muted yellow"],
    }
  end

  it "parses input to the expected rules" do
    expect(parse_input(input)).to eq rules
  end
end
