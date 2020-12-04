require_relative './part1'

describe("validate") do
  it "is false if the none of the given character is present" do
    expect(validate(character: 'a', min: 1, max: 3, password: 'bcdef')).to eq false
  end

  it "is false if too few of the given character are present" do
    expect(validate(character: 'a', min: 2, max: 3, password: 'bcdaef')).to eq false
  end

  it "is false if too many of the given character are present" do
    expect(validate(character: 'a', min: 1, max: 3, password: 'aabcdaefa')).to eq false
  end

  it "is true if the minimum number of the given character is present" do
    expect(validate(character: 'a', min: 1, max: 3, password: 'bcdaef')).to eq true
  end

  it "is true if the maximum number of the given character is present" do
    expect(validate(character: 'a', min: 1, max: 3, password: 'abcdaefa')).to eq true
  end

  it "is true if an acceptable number of the given character is present" do
    expect(validate(character: 'a', min: 1, max: 3, password: 'bcdaefa')).to eq true
  end
end

describe("validate2") do
  it "is true if the given character is present in first position" do
    expect(validate2(character: 'a', min: 1, max: 3, password: 'abc')).to eq true
  end

  it "is true if the given character is present in second position" do
    expect(validate2(character: 'a', min: 1, max: 3, password: 'cba')).to eq true
  end

  it "is false if the given character is not present in either position" do
    expect(validate2(character: 'a', min: 1, max: 3, password: 'cbc')).to eq false
  end

  it "is false if the given character is present in both positions" do
    expect(validate2(character: 'a', min: 1, max: 3, password: 'aba')).to eq false
  end
end

describe("parse") do
  it "properly parses the given format" do
    expect(parse("1-3 a: abcde")).to eq ({character: 'a', min: 1, max: 3, password: 'abcde'})
  end
end

describe("count_valid") do
  let(:input) do
    <<~HERE
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    HERE
  end

  it "properly validates the given input string" do
    expect(count_valid(input)).to eq 2
  end
end

describe("count_valid2") do
  let(:input) do
    <<~HERE
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    HERE
  end

  it "properly validates the given input string" do
    expect(count_valid2(input)).to eq 1
  end
end
